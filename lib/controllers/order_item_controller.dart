import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/order_item.dart';

class OrderItemController extends GetxController {
  var orderItemList = <OrderItem>[].obs;
  var uangBayar = 0.obs;
  final String apiUrl = 'http://service2310020094.test/api/order__items';

  @override
  void onInit() {
    super.onInit();
    fetchOrderItems();
  }

  // GET
  Future<void> fetchOrderItems() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        orderItemList.value = data
            .map((item) => OrderItem.fromJson(item))
            .toList();
      }
    } catch (e) {
      print('Error Fetch: $e');
    }
  }

  // POST
  Future<void> addOrderItem(OrderItem orderItem) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(orderItem.toJson()),
      );
      if (response.statusCode == 201) {
        fetchOrderItems(); // Refresh data after adding
        Get.back(); // Close add form
        Get.snackbar("Success", "Berhasil Menambahkan Order Item");
      }
    } catch (e) {
      Get.snackbar("Error", "Gagal Menyimpan Data");
    }
  }

  // PUT
  Future<void> updateOrderItem(int id, OrderItem orderItem) async {
    try {
      final response = await http.put(
        Uri.parse('$apiUrl/$id'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(orderItem.toJson()),
      );
      if (response.statusCode == 200) {
        fetchOrderItems(); // Refresh data after update
        Get.back();
        Get.snackbar("Success", "Update Order Item Berhasil");
      }
    } catch (e) {
      Get.snackbar("Error", "gagal Mengupdate Data");
    }
  }

  // DELETE
  Future<void> deleteOrderItem(int id) async {
    try {
      final response = await http.delete(Uri.parse('$apiUrl/$id'));
      if (response.statusCode == 200) {
        fetchOrderItems(); // Refresh data after deletion
        Get.snackbar("Success", "Berhasil Menghapus Order Item");
      }
    } catch (e) {
      Get.snackbar("Error", "Gagal Menghapus Data Order Item");
    }
  }
}
