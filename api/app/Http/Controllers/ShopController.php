<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Shop;
use Carbon\Carbon;
use Illuminate\Support\Facades\URL;

class ShopController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $shops = Shop::all();
        $pp = array();
        foreach ($shops as $post) {
            $post->img = isset($post->img) ? URL::to('') . '/' . $post->img : '';
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

        $shop = new Shop;
        $shop->name = $request['name'];
        $shop->description = isset($request['description']) ? $request['description'] : '';
        $img = $request->file('img');
        if (isset($img)) {
            $imgName = $img->getClientOriginalName();
            $imgName = time() . '_' . $imgName;
            $img->move(public_path('assets/img/network'), $imgName);
            $shop->img = 'assets/img/network/' . $imgName;
        }
        $shop->geo_location = isset($request['geo_location']) ? $request['geo_location'] : '';
        $shop->save();
        return  $shop;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $shop = Shop::find($id);
        if ($shop) {
            return $shop;
        }
        return ['msg' => "Shop not found!"];
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
        $shop = Shop::find($id);
        if ($shop) {
            $shop->name = $request['name'];
            $shop->description = isset($request['description']) ? $request['description'] : '';
            $img = $request->file('img');
            if (isset($img)) {
                $imgName = $img->getClientOriginalName();
                $imgName = time() . '_' . $imgName;
                $img->move(public_path('assets/img/network'), $imgName);
                $shop->img = 'assets/img/network/' . $imgName;
            }
            $shop->geo_location = isset($request['geo_location']) ? $request['geo_location'] : '';
            return  $shop;
        }
        return ['msg' => "Shop not found!"];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $shop = Shop::find($id);
        if ($shop) {
            $shop->delete();
            return ['msg' => "Shop deleted successfully!"];
        }
        return ['msg' => "Shop not found!"];
    }
}