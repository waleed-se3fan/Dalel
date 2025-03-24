class SearchModel {
  String name;
  String description;
  SearchModel(this.name, this.description);

  factory SearchModel.fromFirestore(json) {
    return SearchModel(json['name'], json['description']);
  }
}
