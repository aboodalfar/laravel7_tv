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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/episode/{id}', 'EpisodeController@view')->name('view-episode');
Route::post('/like','EpisodeController@getlike');
Route::post('/like/{id}','EpisodeController@like');
Route::post('/dislike/{id}','EpisodeController@dislike');

//dislike routes
Route::post('/dislike','EpisodeController@getDislike');
Route::post('/dislike/{id}','EpisodeController@dislike');

Route::get('/search','SeriesController@search')->name('search');
Route::get('/series/{id}','SeriesController@view')->name('view-series');
Route::post('/series/follow/{id}','SeriesController@follow');

//admin
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
