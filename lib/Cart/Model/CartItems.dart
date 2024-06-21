/// message : "cart returned"
/// cart : [{"product":{"_id":"66718a346f3e2bfb72fd982f","name":"Car Lantern","price":500},"qty":1,"type":"Fogs","_id":"6674b3a8fe37730c3bb84ecc"}]
/// totalPrice : 500

class CartItems {
  CartItems({
      this.message, 
      this.cart, 
      this.totalPrice,});

  CartItems.fromJson(dynamic json) {
    message = json['message'];
    if (json['cart'] != null) {
      cart = [];
      json['cart'].forEach((v) {
        cart?.add(Cart.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
  }
  String? message;
  List<Cart>? cart;
  int? totalPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (cart != null) {
      map['cart'] = cart?.map((v) => v.toJson()).toList();
    }
    map['totalPrice'] = totalPrice;
    return map;
  }

}

/// product : {"_id":"66718a346f3e2bfb72fd982f","name":"Car Lantern","price":500}
/// qty : 1
/// type : "Fogs"
/// _id : "6674b3a8fe37730c3bb84ecc"

class Cart {
  Cart({
      this.product, 
      this.qty, 
      this.type, 
      this.id,});

  Cart.fromJson(dynamic json) {
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    qty = json['qty'];
    type = json['type'];
    id = json['_id'];
  }
  Product? product;
  int? qty;
  String? type;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['qty'] = qty;
    map['type'] = type;
    map['_id'] = id;
    return map;
  }

}

/// _id : "66718a346f3e2bfb72fd982f"
/// name : "Car Lantern"
/// price : 500

class Product {
  Product({
      this.id, 
      this.name, 
      this.price,});

  Product.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    price = json['price'];
  }
  String? id;
  String? name;
  int? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['price'] = price;
    return map;
  }

}