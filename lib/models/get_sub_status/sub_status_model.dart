class SubStatusModel {
  SubStatusModel({
    required this.subStatusId,
    this.subStatusName,
    this.orderby,
  });
  final int subStatusId;
  final String? subStatusName;
  final int? orderby;

  SubStatusModel.fromJson(Map<String, dynamic> json)
      : subStatusId = json["subStatusId"],
        subStatusName = json["subStatusName"],
        orderby = json["orderby"];
}
