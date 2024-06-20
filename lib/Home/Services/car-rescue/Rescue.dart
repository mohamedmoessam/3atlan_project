/// message : "Service found"
/// service : {"_id":"66732fbf7987de09421c71cd","name":"car-rescue","description":"123","technicians":[{"_id":"66734aaa7ce6bdd3d4bd4acf","name":"Mohamed Ali Osama","phone":"01554615877","field":"car-rescue","__v":0},{"_id":"66734ae07ce6bdd3d4bd4ad8","name":"Shady ElRakayby","phone":"012989220","field":"car-rescue","__v":0},{"_id":"66734b117ce6bdd3d4bd4ae0","name":"mazen ahmed","phone":"0110186988","field":"car-rescue","__v":0}],"__v":3}

class Rescue {
  Rescue({
      this.message, 
      this.service,});

  Rescue.fromJson(dynamic json) {
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

/// _id : "66732fbf7987de09421c71cd"
/// name : "car-rescue"
/// description : "123"
/// technicians : [{"_id":"66734aaa7ce6bdd3d4bd4acf","name":"Mohamed Ali Osama","phone":"01554615877","field":"car-rescue","__v":0},{"_id":"66734ae07ce6bdd3d4bd4ad8","name":"Shady ElRakayby","phone":"012989220","field":"car-rescue","__v":0},{"_id":"66734b117ce6bdd3d4bd4ae0","name":"mazen ahmed","phone":"0110186988","field":"car-rescue","__v":0}]
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

/// _id : "66734aaa7ce6bdd3d4bd4acf"
/// name : "Mohamed Ali Osama"
/// phone : "01554615877"
/// field : "car-rescue"
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