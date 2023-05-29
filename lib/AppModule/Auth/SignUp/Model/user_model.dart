class UserModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? image;
  UserModel(
      {this.email,
      this.firstName,
      this.lastName,
      this.password,
      this.uid,
      this.image});

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['first name'],
      lastName: map['last name'],
      password: map['password'],
      image: map['image']
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'first name': firstName,
      'last name': lastName,
      'password': password,
      'image': image
    };
  }
}
