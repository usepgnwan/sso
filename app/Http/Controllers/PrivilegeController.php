<?php

namespace App\Http\Controllers;

use App\Models\Privilege;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Yajra\DataTables\Facades\DataTables;

class PrivilegeController extends Controller
{
    protected $privilege;
    public function __construct(Privilege $privilege)
    {
        $this->privilege = $privilege;
    }
    public function index(Request $request)
    {
        // $d = 'create data';
        // $data = User::find(1)->checkPrivilige($d);
        $this->authorize('view data');
        $data = $this->privilege->get();
        $title = 'Data Privilege';
        if ($request->ajax()) {
            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('last_update', function ($row) {
                    return Carbon::parse($row->last_update)->diffForHumans();
                })
                ->rawColumns(['last_update'])
                ->make(true);
        }
        // return response()->json($data);

        return view('layouts.previlege', compact('data', 'title'));
    }
}
