<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\MenuController;
use App\Http\Controllers\Order_ItemController;


Route::apiResource('menus', MenuController::class);
Route::apiResource('order__items', Order_ItemController::class);
