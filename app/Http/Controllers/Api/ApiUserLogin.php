<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ApiUserLogin extends Controller
{
    protected $user;
    public function __construct(User $user){
        $this->user = $user;
    }

    public function login(Request $request)
    {
      $req = $request->input();
      $validator = Validator::make($req, [
          'email'     => 'required|exists:users,email',
          'password'  => 'required',
      ]);
  
    if ($validator->fails()) {
        $error = $validator->messages()->first();
        $response['status'] = false;
        $response['message'] = $error;
        return response()->json($response, Response::HTTP_BAD_REQUEST);
    }
  
    $data = [
        'email'     => $req['email'],
        'password'  => $req['password']
    ];

    if (auth()->attempt($data)) {
        $user       = Auth::user();
        $objToken   = auth()->user()->createToken('LaravelAuthApp');
        $strToken   = $objToken->accessToken;
        $expiration = $objToken->token->expires_at->diffInSeconds(Carbon::now());

        return response()->json([
          'token'       => $strToken,
          'expires_in'  => $expiration,
          'data'        => $user
        ], 200);
  
    } else {
        return response()->json([
          'status' => false,
          'error' => 'Email atau Password salah'
        ], Response::HTTP_UNAUTHORIZED); 
      }
    }
}
