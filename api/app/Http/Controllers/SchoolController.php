<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\School;
use App\Models\District;

class SchoolController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $schools = School::with('district')->get();
        return response()->json($schools);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(School $school, Request $request)
    {
        try {

            $courses = $request['courses'];

            $school->name = isset($request['name']) ? $request['name'] :  $school->name;
            //  $school->cod = isset($request['cod']) ? $request['cod'] :  $school->cod;
            $school->district_id = isset($request['district_id']) ? $request['district_id'] :  $school->district_id;
            $school->abbreviation = isset($request['abbreviation']) ? $request['abbreviation'] :  $school->abbreviation;
            $school->type = isset($request['type']) ? $request['type'] :  $school->type;
            $school->isCentro = isset($request['isCentro']) ? $request['isCentro'] : ($school->isCentro ? 1 : 0);
            $school->isIfp = isset($request['isIfp']) ? $request['isIfp'] : ($school->isIfp ? 1 : 0);
            $school->save();
            $school->courses()->attach($courses);
            return $school;
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage(), "data" => $school]);
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
            $school = new School();
            $this->create($school, $request);
            $data = School::with('district', 'courses')->where('id', $school->id)->first();
            return response(['msg' => 'School Registered', 'data' => $data], 200);
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
        $school = School::with('district')->where('name', $id)->first();

        return response()->json($school);
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
            $school = School::findOrFail($id);
            if ($school) {
                $this->create($school, $request);
                $data = School::with('district')->where('id', $school->id)->first();
                return response(['msg' => 'School Updated!', 'data' => $data], 200);
            }

            return response(['msg' => 'School not found!'], 404);
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
            $school = School::findOrFail($id);
            if ($school) {
                $school->delete();
                return response()->json(['msg' => 'School deleted successfully!']);
            }
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }
}