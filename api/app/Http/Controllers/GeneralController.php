<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Nationality;
use App\Models\Province;

class GeneralController extends Controller
{
    public function nationalities()
    {
        $data =  Nationality::all();
        return response()->json($data);
    }

    public function provinces()
    {
        $data = Province::with('districts')->get();

        return response()->json($data);
    }
}