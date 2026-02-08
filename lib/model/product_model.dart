class ProductModel {
  List<Products>? products;

  ProductModel({this.products});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  num? id;
  String? name;
  String? category;
  num? price;
  String? currency;
  num? rating;
  bool? inStock;
  String? description;
  String? imageUrl;
  num? itemsCount;
  String? capacity;
  String? author;
  num? pages;

  Products({
    this.id,
    this.name,
    this.category,
    this.price,
    this.currency,
    this.rating,
    this.inStock,
    this.description,
    this.imageUrl,
    this.itemsCount,
    this.capacity,
    this.author,
    this.pages,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    price = json['price'];
    currency = json['currency'];
    rating = json['rating'];
    inStock = json['inStock'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    itemsCount = json['itemsCount'];
    capacity = json['capacity'];
    author = json['author'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category'] = category;
    data['price'] = price;
    data['currency'] = currency;
    data['rating'] = rating;
    data['inStock'] = inStock;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['itemsCount'] = itemsCount;
    data['capacity'] = capacity;
    data['author'] = author;
    data['pages'] = pages;
    return data;
  }
}
