class FakeStoreCartModel {
  final int id;
  final int userId;
  final DateTime date;
  final List<Products> products;

  FakeStoreCartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  factory FakeStoreCartModel.fromJson(Map<String, dynamic> json) {
    return FakeStoreCartModel(
      id: json['id'],
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      products: (json['products'] as List)
          .map((productJson) => Products.fromJson(productJson))
          .toList(),
    );
  }
}

class Products {
  final int productId;
  final int quantity;

  Products({
    required this.productId,
    required this.quantity,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }
}
