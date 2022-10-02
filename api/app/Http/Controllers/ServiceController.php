<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Service;
use Carbon\Carbon;
use Illuminate\Support\Facades\URL;

class ServiceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $services = Service::all();
        $pp = array();
        foreach ($services as $post) {
            $post->img = URL::to('') . '/' . $post->img;
            array_push($pp, $post);
        }
        return $pp;
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
        $service = new Service;

        $service->name = $request['name'];
        $service->description = $request['description'];
        $service->active = isset($request['active']) ? (($request['active']) ? 1 : 0) : 1;
        $img = $request->file('img');
        if (isset($img)) {
            $imgName = $img->getClientOriginalName();
            $imgName = time() . '_' . $imgName;
            $img->move(public_path('assets/img/services'), $imgName);
            $service->img = 'assets/img/services/' . $imgName;
        }
        $service->save();
        return $service;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $service = Service::find($id);
        return $service;
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
        $service = Service::find($id);

        if ($service) {
            $service->name = $request['name'];
            $service->description = $request['description'];
            $service->active = isset($request['active']) ? (($request['active']) ? 1 : 0) : 1;
            $img = $request->file('img');
            if (isset($img)) {
                $imgName = $img->getClientOriginalName();
                $imgName = time() . '_' . $imgName;
                $img->move(public_path('assets/img/services'), $imgName);
                $service->img = 'assets/img/services/' . $imgName;
            }
            $service->updated_at = Carbon::now();

            $service->save();
            return $service;
        } else
            return "Service not found!";
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $service = Service::find($id);
        if ($service) {
            $service->delete();
            return "Service deleted successfully!";
        }
        return "Service not found!";
    }
}