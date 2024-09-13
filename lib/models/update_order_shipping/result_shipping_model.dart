class ResultShippingModel {
  ResultShippingModel({
    required this.orderNumber,
    required this.messageModelList,
  });
  final String orderNumber;
  final List<Map<String, dynamic>> messageModelList;
}
