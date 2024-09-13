class MessageModel {
  MessageModel({
    required this.messageType,
    required this.messageCode,
    required this.message,
    this.orderNumber,
  });
  final String messageType;
  final String messageCode;
  final String message;
  final String? orderNumber;

  MessageModel.fromJson(Map<String, dynamic> json)
      : messageType = json["messageType"],
        messageCode = json["messageCode"],
        message = json["message"],
        orderNumber = json["orderNumber"];

  @override
  String toString() {
    return "messageType:$messageType, messageCode:$messageCode, message:$message, ${(orderNumber != null) ? "orderNumber:$orderNumber" : ""}";
  }
}
