<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Nationality;

class GeneralController extends Controller
{
    public function nationalities()
    {
        $data =  Nationality::all();
        return response()->json($data);
    }
}