<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\jury;
use Haruncpi\LaravelIdGenerator\IdGenerator;

class JuryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id)
    {
        $jurys = Jury::all();
        return $jurys;
        return response()->json($jurys);
    }


    public function jurysBySchool($id)
    {
        $jurys = Jury::where('jurys.ifpcode', $id)->get();
        return $jurys;
        return response()->json($jurys);
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
            $jury = new Jury();
            $id = IdGenerator::generate(['table' => 'jurys', 'length' => 8, 'prefix' => $request['ifpcode']]); 
            $jury->id = $id;
            $jury->course = isset($request['course']) ? $request['course'] :  $jury->course;
            $jury->ifpcode = isset($request['ifpcode']) ? $request['ifpcode'] :  $jury->ifpcode;
            $jury->save();
            $jury = Jury::findOrFail($id);
            return response(['msg' => 'Jury Registered', 'data' => $jury], 200);
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
        $jury = Jury::find($id);

        return response()->json($jury);
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
            $jury = Jury::findOrFail($id);
            if ($jury) {
                $jury->course = isset($request['course']) ? $request['course'] :  $jury->course;
                $jury->ifpcode = isset($request['ifpcode']) ? $request['ifpcode'] :  $jury->ifpcode;
                $jury->save();
                return response(['msg' => 'Jury Updated!', 'data' => $jury], 200);
            }

            return response(['msg' => 'Jury not found!'], 404);
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
            $jury = Jury::findOrFail($id);
            if ($jury) {
                $jury->delete();
                return response()->json(['msg' => 'Jury deleted successfully!']);
            }
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }
}