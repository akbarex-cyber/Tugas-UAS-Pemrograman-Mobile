import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/menu.dart';

class AppMenuController extends GetxController {
  var menuList = <Menu>[].obs;
  final String apiUrl = 'http://service2310020094.test/api/menus';

  @override
  void onInit() {
    super.onInit();
    tangkapanDataMenu();
  }

  // Ambil Data
  Future<void> tangkapanDataMenu() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        menuList.value = data.map((item) => Menu.fromJson(item)).toList();
      }
    } catch (e) {
      print('Error Fetch: $e');
    }
  }

  // Tambah Data
  Future<void> addMenu(Menu menu) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(menu.toJson()),
      );
      if (response.statusCode == 201) {
        tangkapanDataMenu(); // Refresh data setelah tambah
        Get.back(); // Tutup form tambah
        Get.snackbar("Sukses", "Data menu berhasil ditambah");
      }
    } catch (e) {
      Get.snackbar("Error", "Gagal simpan data");
    }
  }

  // Update Data
  Future<void> updateMenu(int id, Menu menu) async {
    try {
      final response = await http.put(
        Uri.parse('$apiUrl/$id'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(menu.toJson()),
      );
      if (response.statusCode == 200) {
        tangkapanDataMenu(); // Refresh data setelah update
        Get.back();
        Get.snackbar("Sukses", "Data menu berhasil diubah");
      }
    } catch (e) {
      Get.snackbar("Error", "Gagal ubah data");
    }
  }

  // Hapus Data
  Future<void> hapusMenu(int id) async {
    try {
      final response = await http.delete(Uri.parse('$apiUrl/$id'));
      if (response.statusCode == 204 || response.statusCode == 200) {
        menuList.removeWhere((m) => m.id == id);
        Get.snackbar("Sukses", "Data berhasil dihapus");
      }
    } catch (e) {
      Get.snackbar("Error", "Gagal hapus data");
    }
  }
}
