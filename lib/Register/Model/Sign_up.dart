/// name : "mohamed"
/// phone : "01065874365"
/// email : "mohmed2002mohamed@gmail.com"
/// password : "1242002"
/// confirmPassword : "1242002"
/// carModel : "Porsche 911"
/// carYear : "2024"

class SignUp {
  SignUp({
      this.name, 
      this.phone, 
      this.email, 
      this.password, 
      this.confirmPassword, 
      this.carModel, 
      this.carYear,});

  SignUp.fromJson(dynamic json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    carModel = json['carModel'];
    carYear = json['carYear'];
  }
  String? name;
  String? phone;
  String? email;
  String? password;
  String? confirmPassword;
  String? carModel;
  String? carYear;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    map['carModel'] = carModel;
    map['carYear'] = carYear;
    return map;
  }

}