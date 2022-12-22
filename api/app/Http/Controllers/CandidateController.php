<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Candidate;
use App\Models\Contact;
class CandidateController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $candidates = Candidate::with('gender','district','school','course','contacts','province')->get();
        return response()->json($candidates);
    }

  
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storeMany(Request $request)
    {

        try {

            foreach ($request->all() as $req) {    
                $candidate = new Candidate();
                $candidate->nome = isset($req['nome']) ? $req['nome'] :  $candidate->nome;
                $candidate->outrosNomes = isset($req['outrosNomes']) ? $req['outrosNomes'] :  $candidate->outrosNomes;
                $candidate->birth_date = isset($req['birth_date']) ? $req['birth_date'] :  $candidate->birth_date;
                $candidate->identificacao = isset($req['identificacao']) ? $req['identificacao'] : ($candidate->identificacao ? 1 : 0);
                $candidate->gender_id = isset($req['gender_id']) ? $req['gender_id'] : $candidate->gender_id;
                $candidate->district_id = isset($req['district_id']) ? $req['district_id'] : $candidate->district_id;
                $candidate->school_id = isset($req['school_id']) ? $req['school_id'] : $candidate->school_id;
                $candidate->course_id = isset($req['course_id']) ? $req['course_id'] : $candidate->course_id;
                $candidate->province_id = isset($req['province_id']) ? $req['province_id'] : $candidate->province_id;
                $candidate->isValidated = isset($req['isValidated']) ? $req['isValidated'] : ($candidate->isValidated ? 1 : 0);
                $candidate->media_12a = isset($req['media_12a']) ? $req['media_12a'] : $candidate->media_12a;
                $candidate->save();
            
                $contact = new Contact(); 
            
                if(isset($request['newcontact'])){
                    $contact->contact = isset($request['newcontact']) ? $request['newcontact'] :  $contact->contact;
                    $contact->id = isset($request['contact_id']) ? $request['contact_id'] :  null;
                    $contact->candidate_id = $candidate->id;
                    $contact->save();
                }
                $candidate = Candidate::with('gender','district','school','course','contacts','province')->where('candidates.id',$candidate->id)->get();

                $candidates[] = $candidate[0];
            }

            return response(['msg' => 'Candidates Registered', 'data' => $candidates], 200);
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()]);
        }
    }
    
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Candidate $candidate, Request $request)
    {
        try {
            $candidate->nome = isset($request['nome']) ? $request['nome'] :  $candidate->nome;
            $candidate->outrosNomes = isset($request['outrosNomes']) ? $request['outrosNomes'] :  $candidate->outrosNomes;
            /*if((isset($request['newcontact'])) || ($contact->id!=null)){
                $candidate->contact_id =  $request['contact_id'] ? $request['contact_id'] :$contact->id;
            }*/
            $candidate->birth_date = isset($request['birth_date']) ? $request['birth_date'] :  $candidate->birth_date;
            $candidate->identificacao = isset($request['identificacao']) ? $request['identificacao'] : ($candidate->identificacao ? 1 : 0);
            $candidate->gender_id = isset($request['gender_id']) ? $request['gender_id'] : $candidate->gender_id;
            $candidate->district_id = isset($request['district_id']) ? $request['district_id'] : $candidate->district_id;
            $candidate->school_id = isset($request['school_id']) ? $request['school_id'] : $candidate->school_id;
            $candidate->course_id = isset($request['course_id']) ? $request['course_id'] : $candidate->course_id;
            $candidate->province_id = isset($request['province_id']) ? $request['province_id'] : $candidate->province_id;
            $candidate->isValidated = isset($request['isValidated']) ? $request['isValidated'] : ($candidate->isValidated ? 1 : 0);
            $candidate->media_12a = isset($request['media_12a']) ? $request['media_12a'] : $candidate->media_12a;
            $candidate->save();

            $contact = new Contact(); 
            if(isset($request['newcontact'])){
                $contact->contact = isset($request['newcontact']) ? $request['newcontact'] :  $contact->contact;
                $contact->id = isset($request['contact_id']) ? $request['contact_id'] :  null;
                $contact->candidate_id = $candidate->id;
                $contact->save();
            }
            return $candidate;
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage(), "data" => $candidate]);
        }
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
            $candidate = new Candidate();
            $this->create($candidate, $request);
            $candidate = Candidate::with('gender','district','school','course','contacts','province')->where('candidates.id',$candidate->id)->get();
            return response(['msg' => 'Candidate Registered', 'data' => $candidate], 200);
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()]);
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
        $candidate = Candidate::with('gender','district','school','course','contacts','province')->where('candidates.id',$id)->get();
        return response()->json($candidate);
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
            $candidate = Candidate::findOrFail($id);
            if ($candidate) {
                $this->create($candidate, $request);
                $data = $candidate = Candidate::with('gender','district','school','course','contacts','province')->where('candidates.id',$id)->get();
                return response(['msg' => 'Candidate Updated!', 'data' => $data], 200);
            }

            return response(['msg' => 'Candidate not found!'], 404);
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
            $candidate = Candidate::findOrFail($id);
            if ($candidate) {
                $candidate->delete();
                return response()->json(['msg' => 'Candidate deleted successfully!']);
            }
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }
}