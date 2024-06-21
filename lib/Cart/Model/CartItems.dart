/// message : "cart returned"
/// cart : [{"product":{"_id":"6674d07e24addc55e619bffa","name":"Car Tire","price":300},"qty":1,"type":"22","image":"images/899b72e5-2eb8-492b-9ef3-d2252889ca9e-Car_tire.png","_id":"66758596da0755110c3e179d"},{"product":{"_id":"6674d07e24addc55e619bffa","name":"Car Tire","price":300},"qty":1,"type":"27","image":"images/899b72e5-2eb8-492b-9ef3-d2252889ca9e-Car_tire.png","_id":"667585a0da0755110c3e17ab"},{"product":{"_id":"66758648da0755110c3e17bb","name":"Phone Holder","price":150},"qty":1,"type":"Dashboard Mounts","image":"images/19f3220a-bf55-4871-9c3c-6988cfc4630c-Phone_holder.png","_id":"66758658da0755110c3e17c8"}]
/// totalPrice : 750

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

/// product : {"_id":"6674d07e24addc55e619bffa","name":"Car Tire","price":300}
/// qty : 1
/// type : "22"
/// image : "images/899b72e5-2eb8-492b-9ef3-d2252889ca9e-Car_tire.png"
/// _id : "66758596da0755110c3e179d"

class Cart {
  Cart({
      this.product, 
      this.qty, 
      this.type, 
      this.image, 
      this.id,});

  Cart.fromJson(dynamic json) {
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    qty = json['qty'];
    type = json['type'];
    image = json['image'];
    id = json['_id'];
  }
  Product? product;
  int? qty;
  String? type;
  String? image;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['qty'] = qty;
    map['type'] = type;
    map['image'] = image;
    map['_id'] = id;
    return map;
  }

}

/// _id : "6674d07e24addc55e619bffa"
/// name : "Car Tire"
/// price : 300

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