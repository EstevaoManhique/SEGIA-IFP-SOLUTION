<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ClassCategory;

class ClassCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $classCategorys = ClassCategory::all();
        return response()->json($classCategorys);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(ClassCategory $classCategory, Request  $request)
    {
        try {
            $classCategory->cod = isset($request['cod']) ? $request['cod'] : $classCategory->cod;
            $classCategory->description = isset($request['description']) ? $request['description'] : $classCategory->description;
            $classCategory->ClassCategory_category_id = isset($request['ClassCategory_category_id']) ? $request['ClassCategory_category_id'] : $classCategory->ClassCategory_category_id;
            $classCategory->save();
            return $classCategory;
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
            $classCategory = new ClassCategory();

            $this->create($classCategory, $request);

            return response(['msg' => 'ClassCategory Registered', 'data' => $classCategory], 200);
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
        $classCategory = ClassCategory::find($id);

        return response()->json($classCategory);
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
            $classCategory = ClassCategory::findOrFail($id);
            if ($classCategory) {
                $this->create($classCategory, $request);
                return response(['msg' => 'ClassCategory Updated!', 'data' => $classCategory], 200);
            }

            return response(['msg' => 'ClassCategory not found!'], 404);
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
            $classCategory = ClassCategory::findOrFail($id);
            if ($classCategory) {
                $classCategory->delete();
                return response()->json(['msg' => 'ClassCategory deleted successfully!']);
            }
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }
}