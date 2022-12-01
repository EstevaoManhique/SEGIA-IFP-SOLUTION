<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categorys = Category::all();
        return response()->json($categorys);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Category $category, Request  $request)
    {
        try {
            $category->cod = isset($request['cod']) ? $request['cod'] : $category->cod;
            $category->description = isset($request['description']) ? $request['description'] : $category->description;
            $category->save();
            return $category;
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
            $category = new Category();

            $this->create($category, $request);

            return response(['msg' => 'Category Registered', 'data' => $category], 200);
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
        $category = Category::find($id);

        return response()->json($category);
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
            $category = Category::findOrFail($id);
            if ($category) {
                $this->create($category, $request);
                return response(['msg' => 'Category Updated!', 'data' => $category], 200);
            }

            return response(['msg' => 'Category not found!'], 404);
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
            $category = Category::findOrFail($id);
            if ($category) {
                $category->delete();
                return response()->json(['msg' => 'Category deleted successfully!']);
            }
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }
}