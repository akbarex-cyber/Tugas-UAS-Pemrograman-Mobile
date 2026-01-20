import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/menu_controller.dart';

class MenuView extends StatelessWidget {
  MenuView({super.key});

  // Menggunakan AppMenuController untuk menghindari konflik dengan sistem Flutter
  final AppMenuController menuController = Get.put(AppMenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Menu')),
      body: Obx(() {
        if (menuController.menuList.isEmpty) {
          return const Center(
            child: Text("Tidak ada data menu atau sedang memuat..."),
          );
        }

        return ListView.builder(
          itemCount: menuController.menuList.length,
          itemBuilder: (context, index) {
            final menu = menuController.menuList[index];
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  menu.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID: ${menu.menuId}"),
                    Text("Harga: Rp ${menu.price}"),
                    Text("Deskripsi: ${menu.description}"),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    
                    if (menu.id != null) {
                      menuController.hapusMenu(menu.id!);
                    }
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
