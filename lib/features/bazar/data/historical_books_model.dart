class HistoricalBoxModel {
  final String name;
  final String creator;
  final String image;
  final String publishDate;
  final String summery;
  final int pages;
  final double rating;
  HistoricalBoxModel(this.name, this.creator, this.image, this.publishDate,
      this.summery, this.pages, this.rating);

  factory HistoricalBoxModel.fromFireStore(json) {
    return HistoricalBoxModel(
      json['name'] ?? '',
      json['creator'] ?? '',
      json['image'] ?? '',
      json['publication_date'] ?? '',
      json['summery'] ?? '',
      json['pages'] ?? 0,
      json['rating'] ?? 0,
    );
  }
}
