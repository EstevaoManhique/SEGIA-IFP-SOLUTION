<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\URL;

class Controller extends BaseController
{
    use DispatchesJobs, ValidatesRequests;

    public function setImgA($arr)
    {
        $pp = array();
        //  if (is_array($arr))
        foreach ($arr as $post) {
            $post->img = isset($post->img) ? URL::to('') . '/' . $post->img : '';
            array_push($pp, $post);
        }
        return $pp;
    }

    public function setImg($post)
    {

        $post->img = isset($post->img) ? URL::to('') . '/' . $post->img : '';


        return $post;
    }
}