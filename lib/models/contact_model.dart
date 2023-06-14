class ContactModel {
  final String name;
  final String phone;
  final String image;

  ContactModel({
    required this.phone,
    required this.name,
    this.image = "https://www.freeiconspng.com/uploads/account-icon-23.png",
  });

  factory ContactModel.fromJson(Map json) {
    return ContactModel(
      phone: json['phone'].toString(),
      name: json["name"],
      image: json["image"],
    );
  }

  @override
  String toString() => '''{"phone":"$phone","name":"$name","image":"$image"}''';
}
