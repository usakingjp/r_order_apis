class DeliveryModel {
  DeliveryModel({
    required this.deliveryName, //配送方法
    this.deliveryClass, //配送区分
  });

  // 例）宅配便
  String deliveryName;

  // 0: 選択なし
  // 1: 普通
  // 2: 冷蔵
  // 3: 冷凍
  // 4: その他１
  // 5: その他２
  // 6: その他３
  // 7: その他４
  // 8: その他５
  int? deliveryClass;
  DeliveryModel.fromJson(Map<String, dynamic> json)
      : deliveryName = json["deliveryName"],
        deliveryClass = json["deliveryClass"];
}
