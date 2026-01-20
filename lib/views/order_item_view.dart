import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_item_controller.dart';
import 'tambah_order_item.dart';
import 'ubah_order_item.dart';

class OrderItemView extends StatelessWidget {
  OrderItemView({super.key});

  final OrderItemController orderItemController = Get.put(
    OrderItemController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Order Item')),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (orderItemController.orderItemList.isEmpty) {
                return const Center(
                  child: Text(
                    "Tidak ada data order item atau sedang memuat...",
                  ),
                );
              }

              return ListView.builder(
                itemCount: orderItemController.orderItemList.length,
                itemBuilder: (context, index) {
                  final orderItem = orderItemController.orderItemList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    elevation: 3,
                    child: ListTile(
                      title: Text(
                        "Order ID: ${orderItem.orderItemId}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Text("Menu ID: ${orderItem.menuId}"),
                          Text("Quantity: ${orderItem.quantity}"),
                          Text("Price: Rp ${orderItem.price}"),
                          Text(
                            "Subtotal: Rp ${orderItem.subTotal}",
                            style: TextStyle(
                              color: Colors.green[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Pupuk: ${orderItem.pupuk}"),
                          Text("Jumlah: ${orderItem.jumlah}"),
                          Text("Tanggal: ${orderItem.tanggal}"),
                        ],
                      ),
                     
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Tombol Edit
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.orange),
                            onPressed: () {
                              // Navigasi ke halaman Edit
                              Get.to(() => UbahOrderItem(orderItem: orderItem));
                            },
                          ),
                          // Tombol Delete
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // Konfirmasi sebelum hapus data
                              Get.defaultDialog(
                                title: "Hapus Data",
                                middleText:
                                    "Apakah Anda yakin ingin menghapus Order ID ${orderItem.orderItemId}?",
                                textConfirm: "Ya",
                                textCancel: "Batal",
                                confirmTextColor: Colors.white,
                                onConfirm: () {
                                  if (orderItem.id != null) {
                                    orderItemController.deleteOrderItem(
                                      orderItem.id!,
                                    );
                                  }
                                  Get.back();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          // Tombol Tambah di bagian bawah 
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.to(() => TambahOrderItem()); // Navigasi ke halaman Tambah
                },
                icon: const Icon(Icons.add),
                label: const Text("Tambah Order Item Baru"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
