<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DasboardController extends Controller
{
    public function index(Request $request)
    {
        $title = 'Selamat Datang, ' . auth()->user()->name;
        return view('layouts.dashboard', compact('title'));
    }
}
