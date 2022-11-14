<?php

namespace App\Http\Middleware;

use App\Http\Resources\ErrorResource;
use App\Models\Error;
use Carbon\Carbon;
use Illuminate\Auth\Middleware\Authenticate as Middleware;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string|null
     */
    protected function redirectTo($request)
    {
        if (! $request->expectsJson()) {
            return route('login');
        }
    }

    protected function unauthenticated($request, array $guards)
    {
        $error=Error::create([
            'timestamp'=>Carbon::now(),
            'description'=>null,
            'status'=>401,
            'title'=>"The resource owner or authorization server denied the request because access token is invalid.",
        ]);
        return new ErrorResource($error);
    }
}
