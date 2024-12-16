<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SeatController;

/*
|----------------------------------------------------------------------
| Web Routes
|----------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

//** for preflights  */

Route::options('{any}', function () {
    return response('', 200)
        ->header('Access-Control-Allow-Origin', '*') // Or specify your allowed domain like 'https://example.com'
        ->header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS')
        ->header('Access-Control-Allow-Headers', 'Content-Type, X-Requested-With, Authorization')
        ->header('Access-Control-Allow-Credentials', 'true');
})->where('any', '.*');  // This ensures the OPTIONS route handles any path

// Corrected route definition for SeatController
Route::get('/seats', [SeatController::class, 'allseats']); // Make sure the method name matches your controller
Route::post('/bookseat', [SeatController::class, 'bookSeats']); // Make sure the method name matches your controller
Route::get('/resetseats', [SeatController::class, 'resetSeat']);



