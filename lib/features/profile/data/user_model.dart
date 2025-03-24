class UserModel {
  String firstName;
  String lastName;
  String email;
  String image;
  String phoneNumber;
  String location;
  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.image,
      required this.phoneNumber,
      required this.location});

  factory UserModel.fromFirestore(json) {
    return UserModel(
        firstName: json['firstName'] ?? '',
        lastName: json['lastName'] ?? '',
        email: json['email'] ?? '',
        image: json['image'] ?? '',
        phoneNumber: json['phoneNumber'] ?? '',
        location: json['location'] ?? '');
  }
}
