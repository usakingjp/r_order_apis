class PointModel {
  PointModel({
    required this.usedPoint, //ポイント利用額
  });
  final int usedPoint;
  PointModel.fromJson(Map<String, dynamic> json)
      : usedPoint = json["usedPoint"];
}
