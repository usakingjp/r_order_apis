import 'sort_model.dart';

class PaginationRequestModel {
  PaginationRequestModel({
    required this.requestRecordsAmount,
    required this.requestPage,
    this.sortModelList,
  });

  // 1ページあたりの取得結果数
  // 最大 1000 件まで指定可能
  final int requestRecordsAmount;

  // リクエストページ番号
  int requestPage;

  // 並び替えモデルリスト
  final SortModel? sortModelList;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {
      "requestRecordsAmount": requestRecordsAmount,
      "requestPage": requestPage,
    };
    if (sortModelList != null) {
      result["SortModelList"] = [sortModelList!.toMap()];
    }
    return result;
  }
}
