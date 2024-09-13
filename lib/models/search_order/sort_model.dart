class SortModel {
  SortModel({required this.sortColumn, required this.sortDirection});

  // 並び替え項目
  // 1: 注文日時
  final int sortColumn;

  // 並び替え方法
  // 1: 昇順（小さい順、古い順）
  // 2: 降順（大きい順、新しい順）
  final int sortDirection;

  Map<String, int> toMap() {
    return {
      "sortColumn": sortColumn,
      "sortDirection": sortDirection,
    };
  }
}
