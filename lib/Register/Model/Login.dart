/// message : "user logged in successfully"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiI2NjM4NmZhZTU4ZjllMTc3N2RhNzVlYWYiLCJpYXQiOjE3MTQ5ODgzNzUsImV4cCI6MTcxNTE2MTE3NX0.qp4kozdnn4PTIbAJgUq_L4NWg6IdF-qoqENuA7YvUiQ"
/// user : {"name":"fcs","email":"kodx@gmail.com","id":"66386fae58f9e1777da75eaf"}

class Login {
  Login({
      this.message, 
      this.token, 
      this.user,});

  Login.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? message;
  String? token;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

/// name : "fcs"
/// email : "kodx@gmail.com"
/// id : "66386fae58f9e1777da75eaf"

class User {
  User({
      this.name, 
      this.email, 
      this.id,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    id = json['id'];
  }
  String? name;
  String? email;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['id'] = id;
    return map;
  }

}