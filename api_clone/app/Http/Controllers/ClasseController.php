<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Classe;

class ClasseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $classes = Classe::with('category')->get();
        return response()->json($classes);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Classe $classe, Request  $request)
    {
        try {
            $classe->cod = isset($request['cod']) ? $request['cod'] : $classe->cod;
            $classe->description = isset($request['description']) ? $request['description'] : $classe->description;
            $classe->category_id = isset($request['category_id']) ? $request['category_id'] : $classe->category_id;
            $classe->save();
            return $classe;
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
            $classe = new Classe();

            $this->create($classe, $request);

            return response(['msg' => 'Classe Registered', 'data' => $classe], 200);
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
        $classe = Classe::find($id);

        return response()->json($classe);
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
            $classe = Classe::findOrFail($id);
            if ($classe) {
                $this->create($classe, $request);
                return response(['msg' => 'Classe Updated!', 'data' => $classe], 200);
            }

            return response(['msg' => 'Classe not found!'], 404);
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
            $classe = Classe::findOrFail($id);
            if ($classe) {
                $classe->delete();
                return response()->json(['msg' => 'Classe deleted successfully!']);
            }
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }
}