class DetailsModel {
  String cityAr;
  String cityEn;
  String discAr;
  String discEn;
  String image;

  DetailsModel({
    required this.cityAr,
    required this.cityEn,
    required this.discAr,
    required this.discEn,
    required this.image,
  });

  // JSON conversion methods
  Map<String, dynamic> toJson() {
    return {
      'cityAr': cityAr,
      'cityEn': cityEn,
      'discAr': discAr,
      'discEn': discEn,
      'image': image,
    };
  }

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      cityAr: json['cityAr'],
      cityEn: json['cityEn'],
      discAr: json['discAr'],
      discEn: json['discEn'],
      image: json['image'],
    );
  }
}
