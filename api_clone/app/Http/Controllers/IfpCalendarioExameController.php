<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\IfpCalendarioExame;
    
class IfpCalendarioExameController extends Controller
{
        /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $calendario = IfpCalendarioExame::all();
        return response()->json($calendario);
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
            $calendario = new IfpCalendarioExame();
            
            $calendario->start_date = $request['start_date'];
            $calendario->end_date = $request['end_date'];
            $calendario->description = $request['description'];
            $calendario->save();
            return response(['msg' => 'Calendar Registered!', 'data' => $calendario], 200);
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
        $ifpCalendarioExame = IfpCalendarioExame::find($id);

        return response()->json($ifpCalendarioExame);
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
            $calendario = IfpCalendarioExame::findOrFail($id);
            if ($calendario) {
                $calendario->start_date = isset($request['start_date'])?$request['start_date']:$calendario->start_date;
                $calendario->end_date = isset($request['end_date'])?$request['end_date']:$calendario->end_date;
                $calendario->description = isset($request['description'])?$request['description']:$calendario->description;
                $calendario->save(); 
                return response(['msg' => 'Ifp Calendar Exam Updated!', 'data' =>$calendario], 200);
            }

            return response(['msg' => 'Ifp Calendar Exam Not Found!'], 404);
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
            $ifpCalendarioExame = IfpCalendarioExame::findOrFail($id);
            if ($ifpCalendarioExame) {
                $ifpCalendarioExame->delete();
                return response()->json(['msg' => 'IfpCalendarioExame deleted successfully!']);
            }
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }
}