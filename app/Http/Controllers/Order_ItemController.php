<?php

namespace App\Http\Controllers;

use App\Models\Order_Item;
use Illuminate\Http\Request;

class Order_ItemController extends Controller
{
    public function index()
    {
        return Order_Item::all();
    }

    public function store(Request $request)
    {
        $request->validate([
            'order_item_id' => 'required|string|unique:order__items',
            'menu_id' => 'required|string',
            'quantity' => 'required|integer|min:1',
            'price' => 'required|integer|min:0',
            'subtotal' => 'required|integer|min:0',
        ]);

        return Order_Item::create($request->all());
    }

    public function show($id)
    {
        return Order_Item::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $order__items = Order_Item::findOrFail($id);
        $request->validate([
            'order_item_id' =>
                'sometimes|required|unique:order__items,order_item_id,' . $order__items->id,
        ]);

        $order__items->update($request->all());
        return $order__items;
    }

    public function destroy($id)
    {
        $order__items = Order_Item::findOrFail($id);
        $order__items->delete();
        return response()->noContent();
    }
}
