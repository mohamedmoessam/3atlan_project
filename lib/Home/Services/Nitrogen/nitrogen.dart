/// message : "Service found"
/// service : {"_id":"66732fd27987de09421c71cf","name":"nitrogen","description":"123","technicians":[{"_id":"66734b5b7ce6bdd3d4bd4ae8","name":"Eslam Ahmed","phone":"012892620","field":"nitrogen","__v":0},{"_id":"66734b887ce6bdd3d4bd4aef","name":"Fawzy Aly","phone":"0155492620","field":"nitrogen","__v":0}],"__v":2}

class Nitrogen {
  Nitrogen({
      this.message, 
      this.service,});

  Nitrogen.fromJson(dynamic json) {
    message = json['message'];
    service = json['service'] != null ? Service.fromJson(json['service']) : null;
  }
  String? message;
  Service? service;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (service != null) {
      map['service'] = service?.toJson();
    }
    return map;
  }

}

/// _id : "66732fd27987de09421c71cf"
/// name : "nitrogen"
/// description : "123"
/// technicians : [{"_id":"66734b5b7ce6bdd3d4bd4ae8","name":"Eslam Ahmed","phone":"012892620","field":"nitrogen","__v":0},{"_id":"66734b887ce6bdd3d4bd4aef","name":"Fawzy Aly","phone":"0155492620","field":"nitrogen","__v":0}]
/// __v : 2

class Service {
  Service({
      this.id, 
      this.name, 
      this.description, 
      this.technicians, 
      this.v,});

  Service.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    if (json['technicians'] != null) {
      technicians = [];
      json['technicians'].forEach((v) {
        technicians?.add(Technicians.fromJson(v));
      });
    }
    v = json['__v'];
  }
  String? id;
  String? name;
  String? description;
  List<Technicians>? technicians;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['description'] = description;
    if (technicians != null) {
      map['technicians'] = technicians?.map((v) => v.toJson()).toList();
    }
    map['__v'] = v;
    return map;
  }

}

/// _id : "66734b5b7ce6bdd3d4bd4ae8"
/// name : "Eslam Ahmed"
/// phone : "012892620"
/// field : "nitrogen"
/// __v : 0

class Technicians {
  Technicians({
      this.id, 
      this.name, 
      this.phone, 
      this.field, 
      this.v,});

  Technicians.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    phone = json['phone'];
    field = json['field'];
    v = json['__v'];
  }
  String? id;
  String? name;
  String? phone;
  String? field;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['field'] = field;
    map['__v'] = v;
    return map;
  }

}