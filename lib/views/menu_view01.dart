import 'package:flutter/material.dart'
    hide MenuController; // Sembunyikan untuk menghindari konflik nama
import 'package:get/get.dart';
import '../controllers/menu_controller.dart';
// Import model menu Anda
import '../models/menu.dart';
// Pastikan file-file view di bawah ini sudah Anda buat atau sesuaikan namanya
import 'tambah_menu.dart';
import 'ubah_menu.dart';

class MenuView extends StatelessWidget {
  // Menggunakan AppMenuController agar sinkron dengan file controller yang sudah diperbaiki
  final AppMenuController controller = Get.put(AppMenuController());

  MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Menu"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              // Menampilkan loading atau pesan jika data kosong
              if (controller.menuList.isEmpty) {
                return const Center(child: Text("Tidak ada data menu"));
              }

              return ListView.builder(
                itemCount: controller.menuList.length,
                itemBuilder: (context, index) {
                  final menu = controller.menuList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey[200],
                            backgroundImage: NetworkImage(
                              menu.image != null && menu.image!.isNotEmpty
                                  ? menu.image!
                                  : 'https://e7.pngegg.com/pngimages/403/1019/png-clipart-student-financial-aid-college-scholarship-higher-education-bachelor-of-cap-hat-caps.png',
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  menu.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                // Perbaikan: Penulisan kurung tutup yang benar
                                Text("ID Menu: ${menu.menuId}"),
                                Text(
                                  "Harga: Rp ${menu.price}",
                                  style: TextStyle(color: Colors.green[700]),
                                ),
                              ],
                            ),
                          ),
                          // Tombol Edit
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.orange),
                            onPressed: () {
                              // Navigasi ke halaman Edit
                              Get.to(() => EditMenuView(menu: menu));
                            },
                          ),
                          // Tombol Delete
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // Konfirmasi sebelum hapus
                              Get.defaultDialog(
                                title: "Hapus Data",
                                middleText:
                                    "Apakah Anda yakin ingin menghapus ${menu.name}?",
                                textConfirm: "Ya",
                                textCancel: "Batal",
                                confirmTextColor: Colors.white,
                                onConfirm: () {
                                  if (menu.id != null) {
                                    controller.hapusMenu(
                                      menu.id!,
                                    ); // Menggunakan int id
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
                  Get.to(() => TambahMenuView()); // Navigasi ke halaman Tambah
                },
                icon: const Icon(Icons.add),
                label: const Text("Tambah Menu Baru"),
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
