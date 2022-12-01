<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Subject;

class SubjectController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $subjects = Subject::all();
        return response()->json($subjects);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Subject $subject, Request  $request)
    {
        try {
            $subject->cod = isset($request['cod']) ? $request['cod'] : $subject->cod;
            $subject->description = isset($request['description']) ? $request['description'] : $subject->description;
            $subject->save();
            return $subject;
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
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
            $subject = new Subject();

            $this->create($subject, $request);

            return response(['msg' => 'Subject Registered', 'data' => $subject], 200);
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
        $subject = Subject::find($id);

        return response()->json($subject);
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
            $subject = Subject::findOrFail($id);
            if ($subject) {
                $this->create($subject, $request);
                return response(['msg' => 'Subject Updated!', 'data' => $subject], 200);
            }

            return response(['msg' => 'Subject not found!'], 404);
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
            $subject = Subject::findOrFail($id);
            if ($subject) {
                $subject->delete();
                return response()->json(['msg' => 'Subject deleted successfully!']);
            }
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }
}