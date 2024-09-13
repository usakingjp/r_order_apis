import 'up_shipping_model.dart';

class BasketidModel {
  BasketidModel({
    required this.basketId,
    required this.shippingModelList,
  });
  final int basketId;
  final List<UpShippingModel> shippingModelList;

  Map<String, dynamic> toMap() {
    return {
      "basketId": basketId,
      "ShippingModelList": [
        for (UpShippingModel model in shippingModelList) model.toMap()
      ],
    };
  }
}
