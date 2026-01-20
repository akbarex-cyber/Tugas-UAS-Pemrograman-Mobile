import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_item_controller.dart';
import '../models/order_item.dart';

class UbahOrderItem extends StatefulWidget {
  final OrderItem orderItem;
  const UbahOrderItem({required this.orderItem});

  @override
  _UbahOrderItemState createState() => _UbahOrderItemState();
}

class _UbahOrderItemState extends State<UbahOrderItem> {
  final OrderItemController controller = Get.find();
  final TextEditingController orderItemIdController = TextEditingController();
  final TextEditingController menuIdController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController subtotalController = TextEditingController();
  final TextEditingController pupukController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    orderItemIdController.text = widget.orderItem.orderItemId.toString();
    menuIdController.text = widget.orderItem.menuId;
    quantityController.text = widget.orderItem.quantity.toString();
    priceController.text = widget.orderItem.price.toString();
    subtotalController.text = widget.orderItem.subTotal.toString();
    pupukController.text = widget.orderItem.pupuk;
    jumlahController.text = widget.orderItem.jumlah.toString();
    tanggalController.text = widget.orderItem.tanggal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ubah Order Item')),
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
              controller: subtotalController,
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
                final updatedOrderItem = OrderItem(
                  orderItemId: orderItemIdController.text,
                  menuId: menuIdController.text,
                  quantity: int.parse(quantityController.text),
                  price: int.parse(priceController.text),
                  subTotal: int.parse(subtotalController.text),
                  pupuk: pupukController.text,
                  jumlah: double.parse(jumlahController.text),
                  tanggal: tanggalController.text,
                );
                await controller.updateOrderItem(
                  widget.orderItem.id!,
                  updatedOrderItem,
                );
                Get.back();
              },
              child: Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }
}
