class UserModel {
  String? userId;
  String? email, name, pic,phone;

  UserModel({required this.userId, required this.email, required this.name, required this.pic , required this.phone});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
    phone = map['phone'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
      'phone':phone
    };
  }
}