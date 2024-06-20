/// message : "Service found"
/// service : {"_id":"667340cb5d33bd7e281b8101","name":"mechanical","description":"mechanical","technicians":[{"_id":"66734cbb7ce6bdd3d4bd4b16","name":"Ragab Attwa","phone":"01057989858","field":"wash","__v":0},{"_id":"66734d217ce6bdd3d4bd4b23","name":"moamen Elsaid","phone":"0158224401","field":"mechanical","__v":0},{"_id":"66734d927ce6bdd3d4bd4b2d","name":"Khaled Khairy","phone":"010584847","field":"mechanical","__v":0},{"_id":"66734dc47ce6bdd3d4bd4b33","name":"Ziad Ahsraf","phone":"0115584587","field":"mechanical","__v":0}],"__v":4}

class Mechanical {
  Mechanical({
      this.message, 
      this.service,});

  Mechanical.fromJson(dynamic json) {
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

/// _id : "667340cb5d33bd7e281b8101"
/// name : "mechanical"
/// description : "mechanical"
/// technicians : [{"_id":"66734cbb7ce6bdd3d4bd4b16","name":"Ragab Attwa","phone":"01057989858","field":"wash","__v":0},{"_id":"66734d217ce6bdd3d4bd4b23","name":"moamen Elsaid","phone":"0158224401","field":"mechanical","__v":0},{"_id":"66734d927ce6bdd3d4bd4b2d","name":"Khaled Khairy","phone":"010584847","field":"mechanical","__v":0},{"_id":"66734dc47ce6bdd3d4bd4b33","name":"Ziad Ahsraf","phone":"0115584587","field":"mechanical","__v":0}]
/// __v : 4

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

/// _id : "66734cbb7ce6bdd3d4bd4b16"
/// name : "Ragab Attwa"
/// phone : "01057989858"
/// field : "wash"
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