class Items {
  Items({
    this.message,
    this.products,
  });

  String? message;
  List<Product>? products;

  Items.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products?.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (products != null) {
      data['products'] = products?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Product {
  Product({
    required this.id,
    this.name,
    this.price,
    this.description,
    this.image,
    this.qty,
  });

  String id;
  String? name;
  int? price;
  String? description;
  String? image;
  int? qty;



 factory Product.fromJson(Map<String, dynamic> json) {
   return Product(
    id : json['_id'],
    name : json['name'],
    price : json['price'],
    description : json['description'],
    image : "https://threetlana.onrender.com/"+ json['image'],
    qty : json['qty'],
   );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['image'] = image;
    data['qty'] = qty;
    return data;
  }
}

