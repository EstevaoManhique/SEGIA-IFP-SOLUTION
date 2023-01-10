<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Exam;
class ExamController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $exames = Exam::all();
        return $exames;
        return response()->json($exames);
    }


    public function examesByCourse($id)
    {
        $exames = Exam::where('exames.course_id', $id)->get();
        return $exames;
        return response()->json($exames);
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
            $exam = new Exam();

            $exam->course_id = 1;//isset($request['course_id']) ? $request['course_id'] :  $exam->course_id;
            $exam->disciplina = isset($request['disciplina']) ? $request['disciplina'] :  $exam->disciplina;
            $exam->save();
            
            $exam = Exam::findOrFail($exam->id);
            return response(['msg' => 'Question Registered', 'data' => $exam], 200);
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }

    public function show($id)
    {
        $exam = Exam::find($id);

        return response()->json($exam);
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
            $exam = Exam::findOrFail($id);
            if ($exam) {
                $exam->disciplina = isset($request['disciplina']) ? $request['disciplina'] :  $exam->disciplina;
                $exam->course_id = isset($request['course_id']) ? $request['course_id'] :  $exam->course_id;
                $exam->save();
                return response(['msg' => 'Exam Updated!', 'data' => $exam], 200);
            }

            return response(['msg' => 'Exam not found!'], 404);
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }

    public function destroy($id)
    {
        try {
            $exam = Exam::findOrFail($id);
            if ($exam) {
                $exam->delete();
                return response()->json(['msg' => 'Question deleted successfully!']);
            }
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }
}