<?php

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

Route::get('/', function () {
    return redirect('login');
    Cookie::queue(
        'uuid',
        'foo',
        3600,
        '/',
        '.example.com',
        false,
        true
    );

    return back();
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
