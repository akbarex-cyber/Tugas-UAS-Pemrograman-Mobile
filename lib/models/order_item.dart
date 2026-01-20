class OrderItem {
  final int? id;
  final String? orderItemId;
  final String menuId;
  final int quantity;
  final int price;
  final int subTotal;
  final String pupuk;
  final double jumlah;
  final String tanggal;

  OrderItem({
    this.id,
    required this.orderItemId,
    required this.menuId,
    required this.quantity,
    required this.price,
    required this.subTotal,
    required this.pupuk,
    required this.jumlah,
    required this.tanggal,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()),
      orderItemId: json['order_item_id'] ?? "",
      menuId: json['menu_id'] ?? "",
      quantity: json['quantity'] is int
          ? json['quantity']
          : int.parse(json['quantity'].toString()),
      price: json['price'] is int
          ? json['price']
          : int.parse(json['price'].toString()),
      subTotal: json['subtotal'] is int
          ? json['subtotal']
          : int.parse(json['subtotal'].toString()),
      pupuk: json['pupuk'] ?? "",
      jumlah: json['jumlah'] is double
          ? json['jumlah']
          : double.parse(json['jumlah'].toString()),
      tanggal: json['tanggal'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_item_id': orderItemId,
      'menu_id': menuId,
      'quantity': quantity,
      'price': price,
      'subtotal': subTotal,
      'pupuk': pupuk,
      'jumlah': jumlah,
      'tanggal': tanggal,
    };
  }
}
