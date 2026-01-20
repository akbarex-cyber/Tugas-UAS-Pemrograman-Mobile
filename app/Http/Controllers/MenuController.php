<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use Illuminate\Http\Request;

class MenuController extends Controller
{
    public function index() 
    {
        return Menu::all();
    }

    public function store(Request $request)
    {
        $request->validate([
            'menu_id' => 'required|unique:menus',
            'name' => 'required|string',
            'price' => 'required|integer|min:0',
            'image' => 'nullable|string',
            'type' => 'required|string',
            'description' => 'required|string',

        ]);

        return Menu::create($request->all());
    }

    public function show($id)
    {
        return Menu::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $menus = Menu::findOrFail($id);
        $request->validate([
            'menu_id' =>
                'sometimes|required|unique:menus,menu_id,' . $menus->id,
        ]);

        $menus->update($request->all());
        return $menus;
    }

    public function destroy($id)
    {
        $menus = Menu::findOrFail($id);
        $menus->delete();
        return response()->noContent();
    }
}
