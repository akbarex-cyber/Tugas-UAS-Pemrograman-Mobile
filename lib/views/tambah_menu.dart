import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/menu_controller.dart';
import '../models/menu.dart';

class TambahMenuView extends StatelessWidget {
  final AppMenuController controller = Get.find();

  final TextEditingController menuIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  TambahMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Menu')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: menuIdController,
              decoration: InputDecoration(labelText: "Menu ID"),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Nama Menu"),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: "Harga"),
            ),
            TextField(
              controller: typeController,
              decoration: InputDecoration(labelText: "Tipe"),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Deskripsi"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final menu = Menu(
                  menuId: menuIdController.text,
                  name: nameController.text,
                  price: int.parse(priceController.text),
                  image: null,
                  type: typeController.text,
                  description: descriptionController.text,
                );
                await controller.addMenu(menu);
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
