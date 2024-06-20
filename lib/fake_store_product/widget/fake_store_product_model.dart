// This FakeStoreProductModel is List which contains Map
// also its contains Rating which is again MAP

class FakeStoreProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  FakeStoreProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory FakeStoreProductModel.fromJson(Map<String, dynamic> json) {
    return FakeStoreProductModel(
      id: json['id'],
      title: json['title'],
      //price: json['price'],
      price: json['price'] is int
          ? (json['price'] as int).toDouble()
          : json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: Rating.fromJson(json['rating']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
    };
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      //rate: json['rate'],
      rate:
          json['rate'] is int ? (json['rate'] as int).toDouble() : json['rate'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }
}
