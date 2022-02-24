import 'package:flutter/cupertino.dart';
import 'package:mobile_app/utils/utils.dart';

class User {
  final int id;
  final String name;
  final String firstName;
  final String phone;
  final String mail;
  final String password;
  final String imageName;

  get image {
    return NetworkImage('$uriApi/images/$imageName');
  }

  User(this.id, this.name, this.firstName, this.phone, this.mail, this.password,
      this.imageName);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        firstName = json['firstName'],
        phone = json['phoneNumber'],
        mail = json['mail'],
        password = json['password'],
        imageName = json['image'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'firstName': firstName,
        'phoneNumber': phone,
        'mail': mail,
        'password': password,
        'image': imageName
      };
}
