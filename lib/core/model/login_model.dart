class LoginModel {
  final bool? status;
  final String message;
  final LoginDataModel? data;

  LoginModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? LoginDataModel.fromJson(json['data']) : null,
    );
  }
}

class LoginDataModel {
  final int? id;
  final String? email;
  final String? password;
  final String? phone;
  final String? name;
  final String? image;
  final int? points;
  final int? credit;
  final String? token;

  LoginDataModel({
    required this.id,
    required this.email,
    required this.password,
    required this.phone,
    required this.name,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) {
    return LoginDataModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      name: json['name'],
      image: json['image'],
      points: json['points'],
      credit: json['credit'],
      token: json['token'],
    );
  }
}