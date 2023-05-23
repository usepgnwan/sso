<?php

namespace App\Http\Controllers;

use App\Models\Privilege;
use App\Models\Role;
use Carbon\Carbon;
use GlobalFunc;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

class RolePriviligeController extends Controller
{

    protected $role;
    protected $privilege;
    private $global;
    public function __construct(Role $role, Privilege $privilege, GlobalFunc $global)
    {
        $this->role = $role;
        $this->global = $global;
        $this->privilege = $privilege;
    }
    public function index(Request $request,$opt = null)
    {
        $this->authorize('view data');
        $role = $this->role->get();
        $privilege = $this->privilege->get();
        // dd($privilege);
        if(!$request->ajax()){ 
            return $this->global->check_url($request);
        }
        $title = 'Data Role Management Privelage';
        if ($request->ajax() && $opt == 'data') {
            return DataTables::of($role)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {

                    $btn = '<a href="javascript:void(0)" class="btn btn-primary btn-sm edit-data " title="lihat detail privilege"  data-id="' . $row->id . '">view</a>';
                    return $btn;
                })
                ->addColumn('roleprivilige', function ($row) {
                    $privileges = '';
                    foreach ($row->privileges as $p) {
                        $privileges .= $p->description . ', ';
                    }
                    return  $privileges;
                })
                ->rawColumns(['action', 'roleprivilige'])
                ->make(true);
        }
        // return response()->json($data);

        return view('layouts.role_privilige', compact('role', 'title', 'privilege'))->render();
    }

    public function store(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'role' => 'required|exists:roles,id'
        ]);

        if ($validate->fails() && is_null($request->privilege) || is_null($request->privilege)) {
            $validate->getMessageBag()->add('privilege', 'The privilege role field is required.');
            return response()->json(['status' => false, 'msg' => 'gagal periksa kembali form', 'data' => $validate->errors()]);
        } else if ($validate->fails()) {
            return response()->json(['status' => false, 'msg' => 'gagal periksa kembali form', 'data' => $validate->errors()]);
        }

        $check = $this->role->find($request->role);
        if (!$check) {
            return response()->json(['status' => false, 'msg' => 'Data tidak ditemukan', 'data' => []]);
        }
        $check->privileges()->attach($request->privilege);
        return response()->json(['status' => true, 'msg' => 'Data Berhasil diubah ', 'data' =>  $check], Response::HTTP_OK);
    }


    public function deletPrivilege($id, $idPrevilege)
    {

        $check = $this->role->find($id);
        if (!$check) {
            return response()->json(['status' => false, 'msg' => 'Data tidak ditemukan', 'data' => []]);
        }
        $check->privileges()->detach($idPrevilege);
        return response()->json(['status' => true, 'msg' => 'Data Berhasil Dihapus ', 'data' =>  $check], Response::HTTP_OK);
    }
}
