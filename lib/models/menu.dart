class Menu {
  final int? id; 
  final String menuId;
  final String name;
  final int price; 
  final String? image;
  final String type;
  final String description;

  Menu({
    this.id,
    required this.menuId,
    required this.name,
    required this.price,
    this.image,
    required this.type,
    required this.description,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      // Pastikan casting tipe data benar
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()),
      menuId: json['menu_id'] ?? "",
      name: json['name'] ?? "",
      price: json['price'] is int
          ? json['price']
          : int.parse(json['price'].toString()),
      image: json['image'],
      type: json['type'] ?? "",
      description: json['description'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menu_id': menuId,
      'name': name,
      'price': price,
      'image': image,
      'type': type,
      'description': description,
    };
  }
}
