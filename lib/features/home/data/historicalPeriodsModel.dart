import 'package:dalel/features/home/data/warsModel.dart';

class HistoricalPeriodsModel {
  String image;
  String name;
  String summary;
  List<WarsModel> wars;

  HistoricalPeriodsModel({
    required this.image,
    required this.name,
    required this.summary,
    required this.wars,
  });

  factory HistoricalPeriodsModel.fromFireBase(Map<String, dynamic> json) {
    return HistoricalPeriodsModel(
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      summary: json['summary'] ?? '',
      wars: (json['wars'] as List)
          .map((e) => WarsModel.fromFireBase(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
