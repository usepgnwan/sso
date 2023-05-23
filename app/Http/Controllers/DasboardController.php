<?php

namespace App\Http\Controllers;

use GlobalFunc;
use Illuminate\Http\Request;

class DasboardController extends Controller
{
    private $global;
    public function __construct(GlobalFunc $global){
        $this->global = $global;
    }
    public function index(Request $request, $id = null)
    {
        if(!$request->ajax()){ 
            return $this->global->check_url($request);
        }
        $title = 'Selamat Datang, ' . auth()->user()->name;
        return view('layouts.dashboard', compact('title'))->render();
        // return response()->json(session()->get('user.id'));
    }

    public function parent(){
        return view('template.admin');
    }
}
