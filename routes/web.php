<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/clear', function (Illuminate\Support\Facades\Cache $cahe) {
    Artisan::call('cache:clear');
    Artisan::call('config:cache');
    Artisan::call('view:clear');
    Artisan::call('route:clear');
    Cache::flush();

    return "Кэш очищен.";
});

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', 'App\Http\Controllers\PanelController@index')->middleware(['auth'])->name('dashboard');
Route::post('/prize/status/set', 'App\Http\Controllers\PrizesController@setStatus');
Route::post('/prize/add/user', 'App\Http\Controllers\PrizesController@addPrizeUser');
Route::post('/prize/convert/points', 'App\Http\Controllers\PrizesController@convertScorePoints');

require __DIR__ . '/auth.php';
