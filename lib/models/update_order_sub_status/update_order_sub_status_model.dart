class UpdateOrderSubStatusModel {
  UpdateOrderSubStatusModel({
    required this.subStatusId,
    required this.orderNumberList,
  });
  final int subStatusId;
  final List<String> orderNumberList;
  Map<String, dynamic> toMap() {
    return {
      "subStatusId": subStatusId,
      "orderNumberList": orderNumberList,
    };
  }

  List<Map<String, dynamic>> toMapList() {
    List<Map<String, dynamic>> result = [];
    int count = 0;
    do {
      result.add({
        "subStatusId": subStatusId,
        "orderNumberList": orderNumberList.skip(count).take(100).toList()
      });
      count += 100;
    } while (count < orderNumberList.length);
    return result;
  }
}
