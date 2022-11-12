<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\ErrorResource;
use App\Models\Error;
use Illuminate\Http\Request;

class BaseController extends Controller
{
    public function success(String $message='Success', mixed $data=[], int $status=200){
        return response()->json([
            'success'   => true,
            'message'   => __($message),
            'data'      => $data
        ], $status);
    }
    
    public function failure(int $status=200){
        if($error=Error::where('status', $status)->first()){
            new ErrorResource($error);
        }else{
            abort('Error status not found', 404);
        }
    }
}
