<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Teacher;
use App\Models\Person;

class TeacherController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $teachers = Teacher::all();
        return response()->json($teachers);
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
            $teacher = new Teacher();
            $person = new Person();
            $person->name = $request['name'];
            $person->surname = $request['surname'];
            $person->save();

            $teacher->person_id = $person->id;
            $teacher->cod = '';
            $teacher->specialty = $request['specialty'];
            $teacher->degree_formation = $request['degree_formation'];
            $teacher->save();
            $data = Teacher::with('person')->where('id', $teacher->id)->get();
            return response(['msg' => 'Teacher Registered!', 'data' => $data], 200);
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
        $teacher = Teacher::find($id);

        return response()->json($teacher);
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
            $teacher = Teacher::findOrFail($id);
            if ($teacher) {
                $person = Person::findOrFail($teacher->person_id);
                $person->name = isset($request['name']) ? $request['name'] :  $person->name;
                $person->surname = isset($request['surname']) ? $request['surname'] :  $person->surname;
                $person->save();

                $teacher->cod = '';
                $teacher->specialty = isset($request['specialty']) ? $request['specialty'] :    $teacher->specialty;
                $teacher->degree_formation = isset($request['degree_formation']) ? $request['degree_formation'] :    $teacher->degree_formation;
                $teacher->save();
                $data = Teacher::with('person')->where('id', $teacher->id)->get();
                return response(['msg' => 'Teacher Updated!', 'data' => $data], 200);
            }

            return response(['msg' => 'Teacher not found!'], 404);
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
            $teacher = Teacher::findOrFail($id);
            if ($teacher) {
                $teacher->delete();
                return response()->json(['msg' => 'Teacher deleted successfully!']);
            }
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }
}