<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order__items', function (Blueprint $table) {
            $table->id();
            $table->string('order_item_id');
            $table->string('quantity');
            $table->bigInteger('price');
            $table->bigInteger('subtotal');
            // Tambah Field
            $table->string('pupuk');       // Tipe string
            $table->double('jumlah');      // Tipe double
            $table->string('tanggal');     // Tipe string

            $table->timestamps(); // Tipe string
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('order__items');
    }
}
