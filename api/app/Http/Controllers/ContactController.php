<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Contact;
class ContactController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $contacts = Contact::all();
        return response()->json($contacts);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Contact $contact, Request $request)
    {
        $contact = new Contact();

        try {
            $contact->contact = isset($request['contact']) ? $request['contact'] :  $contact->contact;
            $contact->save();
            return $contact;
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage(), "data" => $contact]);
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
            $contact = new Contact();
            $contact = $this->create($contact, $request);
            return response(['msg' => 'Contact Registered', 'data' => $contact], 200);
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()]);
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
        $contact = Contact::with('gender','district','school','course')->where('Contacts.id',$id)->get();
        return response()->json($contact);
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
            $contact = Contact::findOrFail($id);
            if ($contact) {
                $this->create($contact, $request);
                $data = $contact = Contact::with('gender','district','school','course')->where('Contacts.id',$id)->get();
                return response(['msg' => 'Contact Updated!', 'data' => $data], 200);
            }

            return response(['msg' => 'Contact not found!'], 404);
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
            $contact = Contact::findOrFail($id);
            if ($contact) {
                $contact->delete();
                return response()->json(['msg' => 'Contact deleted successfully!']);
            }
        } catch (\Exception $e) {
            return response(['msg' => $e->getMessage()], $e->getCode());
        }
    }
}