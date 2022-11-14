<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\ErrorResource;
use App\Models\Error;
use Carbon\Carbon;
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

    public function failure(int $status=500, string $new_title=null, string $description=null){
        switch ($status) {
            case 400:
                $title="Resource Error. Indicates the request contains invalid format/values in input.";
                break;
            case 401:
                $title="The resource owner or authorization server denied the request because access token is invalid.";
                break;
            case 404:
                $title="Resource Error. Indicates the request is pointing to a resource that does not exist.";
                break;
            case 502:
                $title="System Error. One or more services are not available.";
                break;
            default:
                $title=$new_title??"Not found";
                break;
        }
        $error=Error::create([
            'timestamp'=>Carbon::now(),
            'description'=>$description,
            'status'=>$status,
            'title'=>$title,
        ]);
        return new ErrorResource($error);
    }


}
