/// message : "Service found"
/// service : {"_id":"66732fd87987de09421c71d1","name":"air","description":"123","technicians":[{"_id":"66734bbe7ce6bdd3d4bd4af7","name":"Khaled ayman","phone":"0125484820","field":"air","__v":0},{"_id":"66734bec7ce6bdd3d4bd4afe","name":"Nour Mohamed","phone":"0100097955","field":"air","__v":0}],"__v":2}

class Air {
  Air({
      this.message, 
      this.service,});

  Air.fromJson(dynamic json) {
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

/// _id : "66732fd87987de09421c71d1"
/// name : "air"
/// description : "123"
/// technicians : [{"_id":"66734bbe7ce6bdd3d4bd4af7","name":"Khaled ayman","phone":"0125484820","field":"air","__v":0},{"_id":"66734bec7ce6bdd3d4bd4afe","name":"Nour Mohamed","phone":"0100097955","field":"air","__v":0}]
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

/// _id : "66734bbe7ce6bdd3d4bd4af7"
/// name : "Khaled ayman"
/// phone : "0125484820"
/// field : "air"
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