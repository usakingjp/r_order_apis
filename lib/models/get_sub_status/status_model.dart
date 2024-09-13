import 'sub_status_model.dart';

class StatusModel {
  StatusModel({
    required this.orderProgress,
    required this.subStatusModelList,
  });
  final int orderProgress;
  List<SubStatusModel> subStatusModelList;

  StatusModel.fromJson(Map<String, dynamic> json)
      : orderProgress = json["orderProgress"],
        subStatusModelList = [
          for (var e in json["SubStatusModelList"]) SubStatusModel.fromJson(e)
        ];
}
