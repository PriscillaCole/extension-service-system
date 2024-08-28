<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Http\Request;
use Closure;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     */
    protected function redirectTo($request)
    {
        if (!$request->expectsJson()) {
            return route('login'); // Adjust or remove this line as needed
        }
    }
    
    public function handle($request, Closure $next, ...$guards)
    {
        $this->authenticate($request, $guards);

        return $next($request);
    }

    protected function authenticate($request, array $guards)
    {
        $this->authenticateWithBearerToken($request); // Ensure token authentication logic is correct
    }

    protected function authenticateWithBearerToken(Request $request)
    {
        // Example token authentication logic
        if (!$request->bearerToken()) {
            abort(401, 'Unauthorized 2');
        }

      
    }
}
