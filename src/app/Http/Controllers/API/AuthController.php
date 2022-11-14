<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\ErrorResource;
use App\Models\Error;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class AuthController extends BaseController
{

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'email' => 'required|string|email|unique:users',
            'password' => 'required|string|min:6'
        ]);
        if($validator->fails()){
            return $this->failure(401);;
        }
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'unique_id'=>Str::uuid()->toString()
        ]);
        auth()->login($user);
        $accessToken = $user->createToken('authToken')->accessToken;
        return response()->json([ 'user' => $user, 'access_token' => $accessToken], 200);
    }

    public function login(Request $request)
    {
        $data = $request->all();
        $validator = Validator::make($data, [
            'email' => 'required|string|email',
            'password' => 'required|string'
        ]);
        if($validator->fails()){
            return $this->failure(400);;
        }
        if (!auth()->attempt($data)) {
            return $this->failure(401);
        }

        $user = $request->user();
        $token = $user->createToken('authToken')->accessToken;
        return response()->json([ 'user' => $user, 'access_token' => $token], 200);
    }

    public function user(Request $request)
    {
        return response()->json($request->user('api'));
    }

    public function logout(Request $request)
    {
        $request->user()->token()->revoke();
        return response()->json(['message'=>'Successfully logged out']);
    }
}
