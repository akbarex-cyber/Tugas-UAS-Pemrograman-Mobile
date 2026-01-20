import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_item_controller.dart';
import '../models/order_item.dart';

class TambahOrderItem extends StatelessWidget {
  final OrderItemController controller = Get.find();

  final TextEditingController orderItemIdController = TextEditingController();
  final TextEditingController menuIdController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController subTotalController = TextEditingController();
  final TextEditingController pupukController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();

  TambahOrderItem({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Order Item')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: orderItemIdController,
              decoration: InputDecoration(labelText: "Order Item ID"),
            ),
            TextField(
              controller: menuIdController,
              decoration: InputDecoration(labelText: "Menu ID"),
            ),
            TextField(
              controller: quantityController,
              decoration: InputDecoration(labelText: "Quantity"),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: "Price"),
            ),
            TextField(
              controller: subTotalController,
              decoration: InputDecoration(labelText: "Subtotal"),
            ),
            TextField(
              controller: pupukController,
              decoration: InputDecoration(labelText: "Pupuk"),
            ),
            TextField(
              controller: jumlahController,
              decoration: InputDecoration(labelText: "Jumlah"),
            ),
            TextField(
              controller: tanggalController,
              decoration: InputDecoration(labelText: "Tanggal"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final orderItem = OrderItem(
                  orderItemId: orderItemIdController.text,
                  menuId: menuIdController.text,
                  quantity: int.parse(quantityController.text),
                  price: int.parse(priceController.text),
                  subTotal: int.parse(subTotalController.text),
                  pupuk: pupukController.text,
                  jumlah: double.parse(jumlahController.text),
                  tanggal: tanggalController.text,
                );
                await controller.addOrderItem(orderItem);
                Get.back();
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
