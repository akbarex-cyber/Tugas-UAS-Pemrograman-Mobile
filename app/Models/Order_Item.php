<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order_Item extends Model
{
    use HasFactory;
    protected $table = 'order__items';
    protected $fillable = [
        'order_item_id',
        'menu_id',
        'quantity',
        'price',
        'subtotal',
        'pupuk',
        'jumlah',
        'tanggal',
    ];
}
