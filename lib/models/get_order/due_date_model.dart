class DueDateModel {
  DueDateModel(
      {required this.dueDateType, //期限日タイプ
      required this.dueDate //期限日
      });

  // 0: 支払い期限日
  // 1: 支払い方法変更期限日
  // 2: 返金手続き期限日
  final int dueDateType;

  // 2020-08-01
  final String dueDate;
  DueDateModel.fromJson(Map<String, dynamic> json)
      : dueDateType = json["dueDateType"],
        dueDate = json["dueDate"];
}
