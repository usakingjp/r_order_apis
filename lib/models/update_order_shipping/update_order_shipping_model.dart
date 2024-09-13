import 'basketid_model.dart';

class UpdateOrderShippingModel {
  UpdateOrderShippingModel({
    required this.orderNumber,
    required this.basketidModelList,
  });
  final String orderNumber;
  final List<BasketidModel> basketidModelList;

  Map<String, dynamic> toMap() {
    return {
      "orderNumber": orderNumber,
      "BasketidModelList": [
        for (BasketidModel model in basketidModelList) model.toMap()
      ],
    };
  }
}
