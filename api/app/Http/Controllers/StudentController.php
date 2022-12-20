<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Student;
use App\Models\Person;
use App\Http\Controllers\PersonController;

class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $students = Student::with('person', 'school')->get();
        return response()->json($students);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $student = new Student();
            $person = new Person();

            $person->name = isset($request['person']['name']) ? $request['person']['name'] : $person->name;
            $person->surname = isset($request['person']['surname']) ? $request['person']['surname'] : $person->surname;
            $person->genre = isset($request['person']['genre']) ? $request['person']['genre'] : $person->genre;
            $person->birth_date = isset($request['person']['birth_date']) ? $request['person']['birth_date'] : $person->genre;
            $person->contact = isset($request['person']['contact']) ? $request['person']['contact'] : $person->contact;
            $person->email = isset($request['person']['email']) ? $request['person']['email'] : $person->email;
            $person->doc_type = isset($request['person']['doc_type']) ? $request['person']['doc_type'] : $person->doc_type;
            $person->marital_status = isset($request['person']['marital_status']) ? $request['person']['marital_status'] : $person->marital_status;
            $person->mother_name = isset($request['person']['mother_name']) ? $request['person']['mother_name'] : $person->mother_name;
            $person->father_name = isset($request['person']['father_name']) ? $request['person']['father_name'] : $person->father_name;
            $person->mother_contact = isset($request['person']['mother_contact']) ? $request['person']['mother_contact'] : $person->mother_contact;
            $person->father_contact = isset($request['person']['father_contact']) ? $request['person']['father_contact'] : $person->father_contact;
            $person->BI_number = isset($request['person']['BI_number']) ? $request['person']['BI_number'] : $person->BI_number;
            $person->BI_expiration_date = isset($request['person']['BI_expiration_date']) ? $request['person']['BI_expiration_date'] : $person->BI_expiration_date;
            $person->nuit = isset($request['person']['nuit']) ? $request['person']['nuit'] : $person->nuit;
            $person->cPostal = isset($request['person']['cPostal']) ? $request['person']['cPostal'] : $person->cPostal;
            $person->city = isset($request['person']['city']) ? $request['person']['city'] : $person->city;
            $person->district = isset($request['person']['district']) ? $request['person']['district'] : $person->district;
            $person->province = isset($request['person']['province']) ? $request['person']['province'] : $person->province;
            $person->numero_casa = isset($request['person']['numero_casa']) ? $request['person']['numero_casa'] : $person->numero_casa;
            $person->address = isset($request['person']['address']) ? $request['person']['address'] : $person->address;
            $person->nationality_id = isset($request['person']['nationality_id']) ? $request['person']['nationality_id'] : $person->nationality_id;
            $person->profile_picture = isset($request['person']['profile_picture']) ? $request['person']['profile_picture'] : $person->profile_picture;

            $person->save();

            $student->person_id = $person->id;
            $student->school_id = 1;
            $student->enc_name = isset($request['enc_name']) ? $request['enc_name'] :  $student->enc_name;
            $student->enc_contact = isset($request['enc_contact']) ? $request['enc_contact'] : $student->enc_contact;
            $student->enc_work = isset($request['enc_work']) ? $request['enc_work'] : $student->enc_work;
            $student->save();
            $data = Student::with('person')->where('id', $student->id)->get();
            return response(['msg' => 'Student Registered!', 'data' => $data], 200);
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $student = Student::find($id);

        return response()->json($student);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try {
            $student = Student::findOrFail($id);
            if ($student) {
                $person = Person::findOrFail($student->person_id);
                $person->name = isset($request['name']) ? $request['name'] :  $person->name;
                $person->surname = isset($request['surname']) ? $request['surname'] :  $person->surname;
                $person->save();
                $student->school_id = isset($request['school_id']) ? $request['school_id'] : $student->school_id;
                $student->save();
                $data = Student::with('person')->where('id', $student->id)->get();
                return response(['msg' => 'Student Updated!', 'data' => $data], 200);
            }

            return response(['msg' => 'Student not found!'], 404);
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $student = Student::findOrFail($id);
            if ($student) {
                $student->delete();
                return response()->json(['msg' => 'Student deleted successfully!']);
            }
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }
}