<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Person;

class PersonController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $persons = Person::all();
        return response()->json($persons);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Person $person, Request $request)
    {
        try {
            $person->name = isset($request['name']) ? $request['name'] : $person->name;
            $person->surname = isset($request['surname']) ? $request['surname'] : $person->surname;
            $person->genre = isset($request['genre']) ? $request['genre'] : $person->genre;
            $person->marital_status = isset($request['marital_status']) ? $request['marital_status'] : $person->marital_status;
            $person->mother_name = isset($request['mother_name']) ? $request['mother_name'] : $person->mother_name;
            $person->father_name = isset($request['father_name']) ? $request['father_name'] : $person->father_name;
            $person->mother_contact = isset($request['mother_contact']) ? $request['mother_contact'] : $person->mother_contact;
            $person->father_contact = isset($request['father_contact']) ? $request['father_contact'] : $person->father_contact;
            $person->birth_date = isset($request['birth_date']) ? $request['birth_date'] : $person->birth_date;
            $person->BI_number = isset($request['BI_number']) ? $request['BI_number'] : $person->BI_number;
            $person->BI_expiration_date = isset($request['BI_expiration_date']) ? $request['BI_expiration_date'] : $person->BI_expiration_date;
            $person->email = isset($request['email']) ? $request['email'] : $person->email;
            $person->contact = isset($request['contact']) ? $request['contact'] : $person->contact;
            $person->nationality_id = isset($request['nationality_id']) ? $request['nationality_id'] : $person->nationality_id;
            $person->profile_picture = isset($request['profile_picture']) ? $request['profile_picture'] : $person->profile_picture;
            $person->nuit = isset($request['nuit']) ? $request['nuit'] : $person->nuit;
            $person->cPostal = isset($request['cPostal']) ? $request['cPostal'] : $person->cPostal;
            $person->city = isset($request['city']) ? $request['city'] : $person->city;
            $person->district = isset($request['district']) ? $request['district'] : $person->district;
            $person->province = isset($request['province']) ? $request['province'] : $person->province;
            $person->numero_casa = isset($request['numero_casa']) ? $request['numero_casa'] : $person->numero_casa;
            $person->address = isset($request['address']) ? $request['address'] : $person->address;
            $person->save();
            return $person;
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
            $person = new Person();
            $this->create($person, $request);
            return response(['msg' => 'Person Registered', 'data' => $person], 200);
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
        $person = Person::find($id);

        return response()->json($person);
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
            $person = Person::findOrFail($id);
            if ($person) {
                $this->create($person, $request);
                return response(['msg' => 'Person Updated!', 'data' => $person], 200);
            }

            return response(['msg' => 'Person not found!'], 404);
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
            $person = Person::findOrFail($id);
            if ($person) {
                $person->delete();
                return response()->json(['msg' => 'Person deleted successfully!']);
            }
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }
}