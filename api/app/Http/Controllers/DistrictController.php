<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\District;
use App\Models\Province;

class DistrictController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $districts = District::all();
        return response()->json($districts);
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
            $district = new District();
            

            $district->name = isset($request['name']) ? $request['name'] :  $district->name;
            $district->cod = isset($request['cod']) ? $request['cod'] :  $district->cod;
            $district->province_id = isset($request['province_id']) ? $request['province_id'] :  $district->province_id;
           //return $district;
            $district->save();

            return response(['msg' => 'District Registered', 'data' => $district], 200);
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
        $district = District::find($id);

        return response()->json($district);
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
            $district = District::findOrFail($id);
            if ($district) {
                $district->name = isset($request['name']) ? $request['name'] :  $district->name;
                $district->cod = isset($request['cod']) ? $request['cod'] :  $district->cod;
                $district->save();
                return response(['msg' => 'District Updated!', 'data' => $district], 200);
            }

            return response(['msg' => 'District not found!'], 404);
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
            $district = District::findOrFail($id);
            if ($district) {
                $district->delete();
                return response()->json(['msg' => 'District deleted successfully!']);
            }
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }
}