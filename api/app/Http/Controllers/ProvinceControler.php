<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Province;
use App\Models\District;

class ProvinceControler extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $provinces = Province::with('districts')->get();
        return response()->json($provinces);
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
            $province = new Province();
            if (isset($request['id'])) {
                $province = Province::find($request['id']);
            }

            $province->name = isset($request['name']) ? $request['name'] :  $province->name;
            $province->cod = isset($request['cod']) ? $request['cod'] :  $province->cod;
            $province->save();

            return response(['msg' => 'Province Registered', 'data' => $province], 200);
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
        $province = Province::find($id);

        return response()->json($province);
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
            $province = Province::findOrFail($id);
            if ($province) {
                $province->name = isset($request['name']) ? $request['name'] :  $province->name;
                $province->cod = isset($request['cod']) ? $request['cod'] :  $province->cod;
                $province->save();
                return response(['msg' => 'Province Updated!', 'data' => $province], 200);
            }

            return response(['msg' => 'Province not found!'], 404);
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
            $province = Province::findOrFail($id);
            if ($province) {
                $province->delete();
                return response()->json(['msg' => 'Province deleted successfully!']);
            }
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }
}