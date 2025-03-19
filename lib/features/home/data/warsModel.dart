class WarsModel {
  String image;
  String name;
  String description;

  WarsModel({
    required this.image,
    required this.name,
    required this.description,
  });

  factory WarsModel.fromFireBase(Map<String, dynamic> json) {
    return WarsModel(
      image: json['image'] ?? "",
      name: json['name'] ?? "",
      description: json['description'] ?? "",
    );
  }
}
