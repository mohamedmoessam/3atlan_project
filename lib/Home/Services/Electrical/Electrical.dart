/// message : "Service found"
/// service : {"_id":"66732f707987de09421c71c5","name":"electrical","description":"123","technicians":[{"_id":"66733d1a13d7c2ae6c718bf7","name":"mohmed ahmed","phone":"0103746","field":"electrical","__v":0},{"_id":"667349637ce6bdd3d4bd4aa4","name":"Ahmed Aly","phone":"0125184889","field":"electrical","__v":0},{"_id":"667349917ce6bdd3d4bd4aac","name":"Amr Mohamed","phone":"011484889","field":"electrical","__v":0}],"__v":3}

class Electrical {
  Electrical({
      this.message, 
      this.service,});

  Electrical.fromJson(dynamic json) {
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

/// _id : "66732f707987de09421c71c5"
/// name : "electrical"
/// description : "123"
/// technicians : [{"_id":"66733d1a13d7c2ae6c718bf7","name":"mohmed ahmed","phone":"0103746","field":"electrical","__v":0},{"_id":"667349637ce6bdd3d4bd4aa4","name":"Ahmed Aly","phone":"0125184889","field":"electrical","__v":0},{"_id":"667349917ce6bdd3d4bd4aac","name":"Amr Mohamed","phone":"011484889","field":"electrical","__v":0}]
/// __v : 3

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

/// _id : "66733d1a13d7c2ae6c718bf7"
/// name : "mohmed ahmed"
/// phone : "0103746"
/// field : "electrical"
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