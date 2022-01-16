<?php

namespace App\Http\Controllers;

use App\Models\Role;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

class UserController extends Controller
{
    protected $user;
    protected $role;
    public function __construct(User $user, Role $role)
    {
        $this->user = $user;
        $this->role = $role;
    }
    public function index(Request $request)
    {
        $this->authorize('view data');
        $data = $this->user->get();
        $role = $this->role->get();
        $title = 'Data User';
        if ($request->ajax()) {
            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {

                    $btn = '<a href="javascript:void(0)" class="btn btn-primary btn-sm edit-data "  data-id="' . $row->id . '">edit</a>';
                    $btn =  $btn . ' <a href="javascript:void(0)" class="btn btn-danger btn-sm delete-data"  data-id="' . $row->id . '">Hapus</a>';
                    return $btn;
                })
                ->addColumn('role', function ($row) {
                    return $row->role->description;
                })
                ->addColumn('last_update', function ($row) {
                    return Carbon::parse($row->last_update)->diffForHumans();
                })
                ->rawColumns(['action', 'role', 'last_update'])
                ->make(true);
        }
        // return response()->json($data);

        return view('layouts.user', compact('data', 'title', 'role'));
    }

    public function show($id)
    {
        $check = $this->user->find($id);

        if ($check) {
            return response()->json(['status' => true, 'msg' => 'Data ditemukan', 'data' =>  $check], Response::HTTP_OK);
        }

        return response()->json(['status' => false, 'msg' => 'Data tidak ditemukan', 'data' => []], Response::HTTP_NOT_FOUND);
    }
    public function update(Request $request, $id)
    {

        $check = $this->user->find($id);

        $validate = Validator::make($request->all(), [
            'name' => 'required|max:150',
            'email' => 'email:dns|required|unique:users,email,' . $id . '',
            'role' => 'required|exists:roles,id',
        ]);
        if ($validate->fails()) {
            return response()->json(['status' => false, 'msg' => 'gagal veriksa kembali form', 'data' => $validate->errors()]);
        }
        if ($check) {
            $data = [
                'name' => $request->name,
                'email' => $request->email,
                'role_id' => $request->role,
                'last_update' => now()
            ];
            $check->fill($data)->save();

            return response()->json(['status' => true, 'msg' => 'Data Berhasil diubah ', 'data' =>  $check], Response::HTTP_OK);
        }

        return response()->json(['status' => false, 'msg' => 'Data tidak ditemukan', 'data' => []], Response::HTTP_NOT_FOUND);
    }


    public function store(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'name' => 'required|max:150',
            'email' => 'email:dns|required|unique:users,email',
            'role' => 'required|exists:roles,id',
        ]);
        if ($validate->fails()) {
            return response()->json(['status' => false, 'msg' => 'gagal veriksa kembali form', 'data' => $validate->errors()]);
        }
        $data = [
            'name' => $request->name,
            'email' => $request->email,
            'role_id' => $request->role,
            'last_update' => now(),
            'password' => bcrypt('password')
        ];
        $user = $this->user->Create($data);
        return response()->json(['status' => true, 'msg' => 'sukses simpan data', 'data' => $user], Response::HTTP_OK);
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
