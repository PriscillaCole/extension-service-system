<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class JWTMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next)
    {
        try {

            $headers = getallheaders(); //get header

            header('Content-Type: application/json');

            $Authorization = "";
            if (isset($headers['Authorization']) && $headers['Authorization'] != "") {
                $Authorization = $headers['Authorization'];
            } else if (isset($headers['authorization']) && $headers['authorization'] != "") {
                $Authorization = $headers['authorization'];
            } else if (isset($headers['Authorizations']) && $headers['Authorizations'] != "") {
                $Authorization = $headers['Authorizations'];
            } else if (isset($headers['authorizations']) && $headers['authorizations'] != "") {
                $Authorization = $headers['authorizations'];
            } else if (isset($headers['Tok']) && $headers['Tok'] != "") {
                $Authorization = $headers['Tok'];
            }


            $request->headers->set('Authorization', $Authorization); // set header in request
            $request->headers->set('authorization', $Authorization); // set header in request
            $request->headers->set('Authorizations', $Authorization); // set header in request
            $user = Auth::guard('api')->user();
            if (!$user) {
                throw new \Exception('Forbidden, token: ' . $Authorization);
            }
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 401);
        }

        return $next($request);
    }
}
