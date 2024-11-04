<?php

namespace App\Http\Controllers;

abstract class Controller
{
    //
}
class UserController extends Controller
{
    public function index()
    {
        $users = User::all();
        return response()->json($users);
    }
}
