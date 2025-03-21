class HistoricalSouvinersModel {
  final String name;
  final String image;
  final String description;
  final String material;
  final String origin;
  final String price_range;
  final String significance;

  HistoricalSouvinersModel(this.name, this.image, this.description,
      this.material, this.origin, this.price_range, this.significance);
  factory HistoricalSouvinersModel.fromFireStore(json) {
    return HistoricalSouvinersModel(
        json['name'] ?? '',
        json['image'] ?? '',
        json['description'] ?? '',
        json['material'] ?? '',
        json['origin'] ?? '',
        json['price_range'] ?? '',
        json['significance'] ?? '');
  }
}
