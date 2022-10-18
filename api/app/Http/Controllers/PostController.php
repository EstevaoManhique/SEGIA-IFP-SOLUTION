<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;
use Carbon\Carbon;
use Illuminate\Support\Facades\URL;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts = Post::orderBy('created_at', 'desc')->get();
        $pp = array();
        foreach ($posts as $post) {
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
        $post = new Post;
        $post->title = $request['title'];
        $post->titulo = $request['titulo'];
        $post->content = $request['content'];
        $post->conteudo = $request['conteudo'];
        $post->online = isset($request['online']) ? (($request['online']) ? 1 : 0) : 1;
        $img = $request->file('img');
        if (isset($img)) {
            $imgName = $img->getClientOriginalName();
            $imgName = time() . '_' . $imgName;
            $img->move(public_path('assets/img/posts'), $imgName);
            $post->img = 'assets/img/posts/' . $imgName;
        }
        $post->save();
        return  $post;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $post = Post::find($id);
        if ($post) {
            return $post;
        }
        return ['msg' => "Post not found!"];
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
        $post = Post::find($id);
        if ($post) {
            $post->title = $request['title'];
            $post->titulo = $request['titulo'];
            $post->content = $request['content'];
            $post->conteudo = $request['conteudo'];
            // $post->img = isset($request->post['img']) ? $request->post['img'] : '';
            $post->img = ''; // isset($request->post['img']) ? $request->post['img'] : '';
            $post->save();
            return  $post;
        }
        return ['msg' => "Post not found!"];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $post = Post::find($id);
        if ($post) {
            $post->delete();
            return ['msg' => "Post deleted successfully!"];
        }
        return ['msg' => "Post not found!"];
    }
}