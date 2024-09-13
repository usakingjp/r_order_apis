class UpdateOrderDeliveryModel {
  UpdateOrderDeliveryModel({
    required this.orderNumber,
    required this.deliveryName,
  });
  final String orderNumber;

  /// 宅配便など
  final String deliveryName;

  Map<String, dynamic> toMap() {
    return {
      "orderNumber": orderNumber,
      "deliveryName": deliveryName,
    };
  }
}
