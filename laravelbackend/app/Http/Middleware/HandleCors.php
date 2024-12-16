<?php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class HandleCors
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        // Allow all origins or specify a list of allowed origins
        $allowOrigins = '*';  // Use specific origins like ['https://yourdomain.com'] if needed

        // Create the CORS headers
        $response = $next($request);

        $response->headers->set('Access-Control-Allow-Origin', $allowOrigins);
        $response->headers->set('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
        $response->headers->set('Access-Control-Allow-Headers', 'Content-Type, X-Requested-With, Authorization');
        $response->headers->set('Access-Control-Allow-Credentials', 'true');
        $response->headers->set('Access-Control-Max-Age', '3600'); // 1 hour

        // Handle preflight requests (OPTIONS)
        if ($request->getMethod() == "OPTIONS") {
            return response()->json([], 200);
        }

        return $response;
    }
}
