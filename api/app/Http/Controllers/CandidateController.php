<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Candidate;
use App\Models\Contact;
use App\Models\Jury;
use Haruncpi\LaravelIdGenerator\IdGenerator;
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


    
    public function byjury($id)
    {
        $candidates = Candidate::with('gender', 'district', 'school', 'course', 'contacts', 'province')
            ->where('candidates.jury_id', $id)->get();
        return response()->json($candidates);
    }
    
    public function byschool($idSchool)
    {
        $candidates = Candidate::with('gender','district','school','course','contacts','province')
        ->where('candidates.school_id',$idSchool)->get();
        return response()->json($candidates);
    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function bycourse($idSchool)
    {
        $idCourses = [1,2];
        $courses = array();
        foreach ($idCourses as $id) {
            $candidates = Candidate::with('gender','district','school','course','contacts','province')
            ->where('candidates.course_id',$id)->where('candidates.school_id',$idSchool)->get();
            $courses[] = $candidates;
        }
        return response()->json($courses);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storeMany(Request $request)
    {

        $candidates = array();
        $repetidos = 0;
        $registrados = 0;
    
        try {
            foreach ($request->all() as $req) {
                $id = null;
                $id = IdGenerator::generate(['table' => 'candidates', 'length' => 12, 'prefix' => $req['ifpcode']]);        
                $candidate = new Candidate();
                $candidate->nome = isset($req['nome']) ? $req['nome'] :  $candidate->nome;
                $candidate->id = $id;
                $candidate->outrosNomes = isset($req['outrosNomes']) ? $req['outrosNomes'] :  $candidate->outrosNomes;
                $candidate->birth_date = isset($req['birth_date']) ? $req['birth_date'] :  $candidate->birth_date;
                $candidate->identificacao = isset($req['identificacao']) ? $req['identificacao'] : ($candidate->identificacao ? 1 : 0);
                $candidate->gender_id = isset($req['gender_id']) ? $req['gender_id'] : $candidate->gender_id;
                $candidate->district_id = isset($req['district_id']) ? $req['district_id'] : $candidate->district_id;
                $candidate->school_id = isset($req['school_id']) ? $req['school_id'] : $candidate->school_id;
                $candidate->course_id = isset($req['course_id']) ? $req['course_id'] : $candidate->course_id;
                $candidate->province_id = isset($req['province_id']) ? $req['province_id'] : $candidate->province_id;
                $candidate->isValidated = 1;
                $candidate->media_12a = isset($req['media_12a']) ? $req['media_12a'] : $candidate->media_12a;
                $candidate->jury_id = isset($req['jury_id']) ? $req['jury_id'] : $candidate->jury_id;
                
                $search = null;
                $search = Candidate::where("candidates.identificacao", $candidate->identificacao)->exists();
                if($search){
                    $repetidos++; 
                }else{
                    $registrados++;
                    $candidate->save();
                    $contact = new Contact(); 
            
                    if(isset($request['newcontact'])){
                        $contact->contact = isset($request['newcontact']) ? $request['newcontact'] :  $contact->contact;
                        $contact->id = isset($request['contact_id']) ? $request['contact_id'] :  null;
                        $contact->candidate_id = $candidate->id;
                        $contact->save();
                    }
                    $candidate = Candidate::with('gender','district','school','course','contacts','province')->where('candidates.id',$id)->get();
                    
                    $candidates[] = $candidate[0];
                }

            }

            return response(['msg' => 'Candidates Registered', 'data' => $candidates,
            'importados' =>$registrados + $repetidos,'registrados' =>$registrados,'repetidos' =>$repetidos], 200);
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
        $repetidos = 0;
        $id = IdGenerator::generate(['table' => 'candidates', 'length' => 12, 'prefix' => $request['ifpcode']]);
        try {

            $candidate->nome = isset($request['nome']) ? $request['nome'] :  $candidate->nome;
            $candidate->id = $id;
            $candidate->outrosNomes = isset($request['outrosNomes']) ? $request['outrosNomes'] :  $candidate->outrosNomes;
            $candidate->birth_date = isset($request['birth_date']) ? $request['birth_date'] :  $candidate->birth_date;
            $candidate->identificacao = isset($request['identificacao']) ? $request['identificacao'] : ($candidate->identificacao ? 1 : 0);
            $candidate->gender_id = isset($request['gender_id']) ? $request['gender_id'] : $candidate->gender_id;
            $candidate->district_id = isset($request['district_id']) ? $request['district_id'] : $candidate->district_id;
            $candidate->school_id = isset($request['school_id']) ? $request['school_id'] : $candidate->school_id;
            $candidate->course_id = isset($request['course_id']) ? $request['course_id'] : $candidate->course_id;
            $candidate->province_id = isset($request['province_id']) ? $request['province_id'] : $candidate->province_id;
            $candidate->isValidated = isset($request['isValidated']) ? $request['isValidated'] : ($candidate->isValidated ? 1 : 0);
            $candidate->media_12a = isset($request['media_12a']) ? $request['media_12a'] : $candidate->media_12a;

            $search = Candidate::where("candidates.identificacao",$candidate->identificacao)->exists();
            
            if($search){
                $repetidos++;
            }else{
                $candidate->save();

                $contact = new Contact(); 
                if(isset($request['newcontact'])){
                    $contact->contact = isset($request['newcontact']) ? $request['newcontact'] :  $contact->contact;
                    $contact->id = isset($request['contact_id']) ? $request['contact_id'] :  null;
                    $contact->candidate_id = $candidate->id;
                    $contact->save();
                }
                return $id;               
            }
 
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
            $id = $this->create($candidate, $request);
            $candidate = Candidate::with('gender','district','school','course','contacts','province')->where('candidates.id',$id)->get();
            
            $mensagem = null;
            if($id){
                $mensagem = 'Candidate Registered';
            }else{
                $mensagem = 'Candidate already exists';
            }
            
            return response(['msg' => $mensagem, 'data' => $candidate], 200);
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage(), "data" => $candidate]);
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
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function createjury(Request $request){
        try {            
            $candidate = new Candidate();
            $jurys = array();
            $juri = array();
            $courses = $request->all();
            $jurybycourse = array();
            foreach ($courses as $course) {
                $coursename = $course[0][0]['course']['description'];
                $ifpcode = $course[0][0]['school']['cod'];
                $jurys = null;
                
                foreach($course as $candidates){
                    
                    $jury = new Jury();
                    $jury->course = $coursename;
                    $jury->ifpcode = $ifpcode;
                    $jury->save();
                    $juri = null;
                    foreach($candidates as $candidate){
                        
                        $candidate = Candidate::findOrFail($candidate['id']);
                        $candidate->jury_id = $jury->id;
                        $candidate->save();
                        $juri[] = $candidate;
                    
                    }
                    $jurys [] = $juri;
                }
                $jurybycourse[] = $jurys;
            }    
            return response(['msg' => "Juris criados com sucesso!", 'data' => $jurybycourse], 200);
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage(), "data" => $jurys]);
        }
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