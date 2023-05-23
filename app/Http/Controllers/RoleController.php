<?php

namespace App\Http\Controllers;

use App\Models\Role;
use App\Models\User;
use Carbon\Carbon;
use GlobalFunc;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

class RoleController extends Controller
{
    protected $role;
    private $global;
    public function __construct(Role $role, GlobalFunc $global)
    {
        $this->role = $role;
        $this->global = $global;
    }
    public function index(Request $request, $opt = null)
    {
        // $d = 'create data';
        // $d = "author";
        // $data = User::find(1)->hasRole($d);
        // return response()->json($data);
        // die;
        $this->authorize('view data');
        if(!$request->ajax()){ 
            return $this->global->check_url($request);
        }
        $data = $this->role->get();
        $title = 'Data Role';
        if ($request->ajax() && $opt == 'data') {
            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {

                    $btn = '<a href="javascript:void(0)" class="btn btn-primary btn-sm edit-data "  data-id="' . $row->id . '">edit</a>';
                    $btn =  $btn . ' <a href="javascript:void(0)" class="btn btn-danger btn-sm delete-data"  data-id="' . $row->id . '">Hapus</a>';
                    return $btn;
                })
                ->addColumn('last_update', function ($row) {
                    return Carbon::parse($row->last_update)->diffForHumans();
                })
                ->rawColumns(['action', 'last_update'])
                ->make(true);
        }
        // return response()->json($data);

        return view('layouts.role', compact('data', 'title'))->render();
    }

    public function show($id)
    {
        $check = $this->role->find($id);

        if ($check) {
            return response()->json(['status' => true, 'msg' => 'Data ditemukan', 'data' =>  $check], Response::HTTP_OK);
        }

        return response()->json(['status' => false, 'msg' => 'Data tidak ditemukan', 'data' => []], Response::HTTP_NOT_FOUND);
    }
    public function update(Request $request, $id)
    {

        $check = $this->role->find($request->id_role);

        $validate = Validator::make($request->all(), [
            'description_role' => 'required|unique:roles,description,' . $id . ''
        ]);
        if ($validate->fails()) {
            return response()->json(['status' => false, 'msg' => 'gagal periksa kembali form', 'data' => $validate->errors()]);
        }
        if ($check) {
            $data = [
                'description' => $request->description_role,
                'last_update' => now()
            ];
            $check->fill($data)->save();;

            return response()->json(['status' => true, 'msg' => 'Data Berhasil diubah ', 'data' =>  $check], Response::HTTP_OK);
        }

        return response()->json(['status' => false, 'msg' => 'Data tidak ditemukan', 'data' => []], Response::HTTP_NOT_FOUND);
    }
    public function store(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'description_role' => 'required|unique:roles,description'
        ]);
        if ($validate->fails()) {
            return response()->json(['status' => false, 'msg' => 'gagal veriksa kembali form', 'data' => $validate->errors()]);
        }

        $role = Role::Create(['description' => $request->description_role, 'last_update' => now()]);
        return response()->json(['status' => true, 'msg' => 'sukses simpan data', 'data' => $role], Response::HTTP_OK);
    }
    public function destroy($id)
    {
        $check = $this->role->find($id);

        if ($check) {
            $check->delete();
            return response()->json(['status' => true, 'msg' => 'Berhasil Hapus Data'], Response::HTTP_OK);
        }
        return response()->json(['status' => false, 'msg' => 'Gagal Hapus Data'], Response::HTTP_BAD_REQUEST);
    }
}
