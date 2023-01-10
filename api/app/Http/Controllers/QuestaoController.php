<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Questao;
class QuestaoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $questoes = Questao::all();
        return response()->json($questoes);
    }

        /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
        /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function questionsByExam($id)
    {
        $questoes = Questao::where('questoes.exam_id', $id)->get();
        return $questoes;
        return response()->json($questoes);
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
        $questions = array();
        try {
            foreach ($request->all() as $req) {
                $questao = new Questao();
                $questao->resposta = isset($req['resposta']) ? $req['resposta'] : $questao->resposta;
                $questao->numero = isset($req['numero']) ? $req['numero'] : $questao->numero;
                $questao->cotacao = isset($req['cotacao']) ? $req['cotacao'] : $questao->cotacao;
                $questao->exam_id = isset($req['exam_id']) ? $req['exam_id'] : $questao->exam_id;
                $questao->save();

                $questao = Questao::findOrFail($questao->id);
                $questions[] = $questao;
            }
            return response(['msg' => 'Question Registered', 'data' => $questions], 200);
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()]);
        }
    }

    public function show($id)
    {
        $questao = Questao::find($id);

        return response()->json($questao);
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
            $questao = Questao::findOrFail($id);
            if ($questao) {
                $questao->resposta = isset($request['resposta']) ? $request['resposta'] : $questao->resposta;
                $questao->numero = isset($request['numero']) ? $request['numero'] : $questao->numero;
                $questao->cotacao = isset($request['cotacao']) ? $request['cotacao'] : $questao->cotacao;
                $questao->exam_id = isset($request['exam_id']) ? $request['exam_id'] : $questao->exam_id;
                $questao->save();
                return response(['msg' => 'Question Updated!', 'data' => $questao], 200);
            }

            return response(['msg' => 'Questao not found!'], 404);
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }

    public function destroy($id)
    {
        try {
            $questao = Questao::findOrFail($id);
            if ($questao) {
                $questao->delete();
                return response()->json(['msg' => 'Question deleted successfully!']);
            }
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }
}