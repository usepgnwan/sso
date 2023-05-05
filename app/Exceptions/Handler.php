<?php

namespace App\Exceptions;

use Exception;
use Illuminate\Http\Response;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\Routing\Exception\RouteNotFoundException;
use Throwable;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var array<int, class-string<Throwable>>
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     *
     * @return void
     */
    public function register()
    {
        /***
         * HANDLER FOR CHEKING REQUEST NOT ALLOWED METHOD
         */
        $this->renderable(function (Exception $exception, $request) {
            if ($exception instanceof MethodNotAllowedHttpException) {
                return response()->json(['status'=>false,"message"=>"Request not valid on " . request()->method()], Response::HTTP_FORBIDDEN);
            }
         });
         
        /**
         * REGISTER HANDLER FOR GATE - CHECKING USER NO HAVE ACCESS FOR ACCESS FUNCTION ON GATE API
         */ 
        $this->renderable(function (Exception $exception, $request) {
           if( !is_null($request->route())){ 
                if ( $exception instanceof Exception && in_array('api',$request->route()->getAction('middleware')) && ! empty(auth()->user())) {
                    return response()->json([
                        'status' => false,
                        'message' => 'Not authenticated / Acces Denied !'
                    ], Response::HTTP_UNAUTHORIZED);
                } 
             
            }
        });

        $this->renderable(function (Throwable $exception, $request) {
            if( $request->is('api/*')){
                if ($exception instanceof ModelNotFoundException) {
                    $model = strtolower(class_basename($exception->getModel())); 
                    return response()->json([
                            'status' => false,
                            'error' => 'Model '. $model .' not found'
                            ], Response::HTTP_NOT_FOUND);
                }   
                if ($exception instanceof NotFoundHttpException) {
                    return response()->json([
                        'status' => false,
                         'error' => 'Resource not found'
                     ], Response::HTTP_NOT_FOUND);  
                    }
            }else{
                if ($exception->getStatusCode() == 404) {
                    $title = $exception->getStatusCode() . ' - Page Not Found ';
                    return response()->view('errors.' . '404', ["title"=>$title], 404);
                }
            }
        });
    }
}
