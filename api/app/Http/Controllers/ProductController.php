<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use Carbon\Carbon;
use Illuminate\Support\Facades\URL;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts = Product::all();
        $pp = $this->setImgA($posts);
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
        $product = new Product;

        $product->name = $request['name'];
        $product->description = $request['description'];
        $product->price = $request['price'];
        $product->online = isset($request['online']) ? (($request['online']) ? 1 : 0) : 0;
        $img = $request->file('img');
        if (isset($img)) {
            $imgName = $img->getClientOriginalName();
            $imgName = time() . '_' . $imgName;
            $img->move(public_path('assets/img/products'), $imgName);
            $product->img = 'assets/img/products/' . $imgName;
        }
        $product->save();

        return  $this->setImg($product);;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $product = Product::find($id);
        if ($product) {
            return  $this->setImg($product);
        }
        return ['msg' => "Product not found!"];
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
        $product = Product::find($id);
        if ($product) {
            $product->name = $request['name'];
            $product->description = $request['description'];
            $product->price = $request['price'];
            $product->online = isset($request['online']) ? (($request['online']) ? 1 : 0) : 0;
            $img = $request->file('img');
            if (isset($img)) {
                $imgName = $img->getClientOriginalName();
                $imgName = time() . '_' . $imgName;
                $img->move(public_path('assets/img/products'), $imgName);
                $product->img = 'assets/img/products/' . $imgName;
            }
            $product->updated_at = Carbon::now();
            $product->save();

            return  $this->setImg($product);
        }
        return ['msg' => "Product not found!"];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product = Product::find($id);
        if ($product) {
            $product->delete();
            return "Product deleted successfully!";
        }
        return ['msg' => "Product not found!"];
    }
}