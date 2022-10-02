<?php

namespace App\Http\Controllers;

//use Mail;
//use Message;
use Illuminate\Support\Facades\Mail;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Requests\UserRequest;
use App\Http\Requests\ForgotRequest;
use App\Http\Requests\ResetRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Carbon\Carbon;
//use Illuminate\Support\Mail;

class AuthController extends Controller
{

    public function login(Request $request)
    {
        try {
            if (Auth::attempt($request->only('email', 'password'))) {
                /** @var User $user*/
                $user = Auth::user();
                $token = $user->createToken(name: 'app')->accessToken;
                return  response([
                    'message' => 'sucess login!',
                    'user' => $user,
                    'token' => $token
                ]);
            }
        } catch (\Exception $e) {
            return  response([
                'message' => $e->getMessage()
            ], status: 400);
        }

        return response(['message' => 'Invalid username/password'], status: 401);
    }

    public function user()
    {
        if (Auth::check()) {
            return Auth::user();
        }
    }


    public function register(UserRequest $request)
    {
        try {

            $user = new User();

            $user->email = $request['email'];
            $user->name = $request['name'];
            $user->password = Hash::make($request['password']);
            $user->admin = isset($request['admin']) ? (($request['admin']) ? 1 : 0) : 0;
            $user->save();
            return  $user;
        } catch (\Exception $e) {
            return response(['message' => $e->getMessage()], 400);
        }
    }

    public function forgot(ForgotRequest $request)
    {
        $email = $request['email'];
        if (User::where('email', $request['email'])->doesntExist()) {
            return response(['message' => 'User does not exist!'], 404);
        }
        $token = Str::random(15);

        try {
            DB::table('password_resets')->insert([
                'email' => $email,
                'token' => $token,
                'expires_at' => Carbon::now()->addMinutes(60)
            ]);

            Mail::send('mailer.Reset', ['token' => $token], function ($message) use ($email) {
                $message->to($email);
                $message->subject('Reset your Password');
            });

            //send email
            return response(['message' => 'Check your email!']);
        } catch (\Exception $e) {
            return response(['message' => $e->getMessage()], 400);
        }
    }

    public function reset(ResetRequest $request)
    {
        try {
            $token = $request->input('token');
            if (!$pswReset = DB::table('password_resets')->where('token', $token)->where('expires_at', '<=', Carbon::now())->first()) {
                return response(['message' => 'Invalide token!'], status: 400);
            }
            if (!$user = User::where('email', $pswReset->email)->first()) {
                return response(['message' => 'User does not exist!'], status: 400);
            }
            $user->password = Hash::make($request->input('password'));
            $user->save();

            return response(['message' => 'Password reseted!']);
        } catch (\Exception $e) {
            return response(['message' => $e->getMessage()], status: 400);
        }
    }

    public function sendmail(User $user)
    {
        Mail::send('emails.reminder', ['user' => $user], function ($m) use ($user) {
            $m->from('hello@app.com', 'Your Application');

            $m->to($user->email, $user->name)->subject('Your Reminder!');
        });
    }
}