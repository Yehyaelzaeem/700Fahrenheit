class User1 {
  final int? id;
  final String name;
  final String phone;
  final String address;
  final String image;
  final String? email;

  User1(
      {this.id,
        required this.name,
        required this.phone,
        required this.address,
        required this.image,
        this.email});

  User1.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        phone = res["phone"],
        address = res["address"],
        image = res["image"],
        email = res["email"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'address': address,
      'image': image,
      'email': email,
    };
  }
}
