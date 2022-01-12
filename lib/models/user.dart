class User {
   final int id;
  final String name;
  final String firstName;
  final String phone;
  final String mail;
  final String password;

  User(this.id, this.name, this.firstName, this.phone, this.mail, this.password);

  User.fromJson(Map<String, dynamic> json):
        id = int.parse(json['id']),
        name = json['name'],
        firstName = json['firstName'],
        phone = json['phoneNumber'],
        mail = json['mail'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'id':id,
    'name':name,
    'firstName':firstName,
    'phone':phone,
    'mail':mail,
    'password':password
  };
}