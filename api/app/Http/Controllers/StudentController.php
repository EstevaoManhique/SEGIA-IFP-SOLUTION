<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Student;
use App\Models\Person;

class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $students = Student::with('person')->get();
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
            $person->name = $request['name'];
            $person->surname = $request['surname'];
            $person->save();

            $student->person_id = $person->id;
            $student->school_id = $request['school_id'];
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