class PixModel {
  final String image;
  final String code;
  final double totalValue;

  PixModel({
    required this.image,
    required this.code,
    required this.totalValue,
  });

  factory PixModel.fromMap(Map<String, dynamic> map) {
    return PixModel(
      image: map['image'] ?? '',
      code: map['code'] ?? '',
      totalValue: map['totalValue']?.toDouble() ?? 0.0,
    );
  }
}
