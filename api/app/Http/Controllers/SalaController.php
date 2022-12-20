<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Sala;
class SalaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $salas = Sala::all();
        return response()->json($salas);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Sala $sala, Request  $request)
    {
        try {
            $sala->id = isset($request['id']) ? $request['id'] : $sala->id;
            $sala->capacidade = isset($request['capacidade']) ? $request['capacidade'] : $sala->capacidade;
            $sala->save();
            return $sala;
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
            $sala = new Sala();

            $this->create($sala, $request);

            return response(['msg' => 'Sala Registered', 'data' => $sala], 200);
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
        $sala = Sala::find($id);

        return response()->json($sala);
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
            $sala = Sala::findOrFail($id);
            if ($sala) {
                $this->create($sala, $request);
                return response(['msg' => 'Sala Updated!', 'data' => $sala], 200);
            }

            return response(['msg' => 'Sala not found!'], 404);
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
            $sala = Sala::findOrFail($id);
            if ($sala) {
                $sala->delete();
                return response()->json(['msg' => 'Sala deleted successfully!']);
            }
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }
}