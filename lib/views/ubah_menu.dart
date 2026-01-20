import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/menu_controller.dart';
import '../models/menu.dart';

class EditMenuView extends StatefulWidget {
  final Menu menu;
  const EditMenuView({required this.menu});

  @override
  _EditMenuViewState createState() => _EditMenuViewState();
}

class _EditMenuViewState extends State<EditMenuView> {
  final AppMenuController controller = Get.find();
  final TextEditingController menuIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    menuIdController.text = widget.menu.menuId;
    nameController.text = widget.menu.name;
    priceController.text = widget.menu.price.toString();
    typeController.text = widget.menu.type;
    descriptionController.text = widget.menu.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Menu")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: menuIdController,
                decoration: InputDecoration(labelText: 'Menu ID'),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nama Menu'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Harga'),
              ),
              TextField(
                controller: typeController,
                decoration: InputDecoration(labelText: 'Tipe'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Deskripsi'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final updatedMenu = Menu(
                    menuId: menuIdController.text,
                    name: nameController.text,
                    price: int.parse(priceController.text),
                    image: null,
                    type: typeController.text,
                    description: descriptionController.text,
                  );
                  controller.updateMenu(widget.menu.id!, updatedMenu);
                  Get.back();
                },
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
