class CancelOrderModel {
  CancelOrderModel({
    required this.orderNumber,
    required this.inventoryRestoreType,
    required this.changeReasonDetailApply,
  });
  final String orderNumber;

  /// 在庫連動区分
  /// 0: 商品設定に合わせる
  /// 1: 在庫連動する
  /// 2: 在庫連動しない
  final int inventoryRestoreType;

  /// キャンセル理由
  /// (お客様都合による)
  /// 1: キャンセル
  /// 2: 受取後の返品
  /// 3: 長期不在による受取拒否
  /// 4: 未入金
  /// 5: 代引決済の受取拒否
  /// 6: その他
  ///
  /// (店舗都合による)
  /// 8: 欠品
  /// 10: その他
  /// 13: 発送遅延
  /// 14: 顧客・配送対応注意表示
  /// 15: 返品（破損・品間違い）
  final int changeReasonDetailApply;

  Map<String, dynamic> toMap() {
    return {
      "orderNumber": orderNumber,
      "inventoryRestoreType": inventoryRestoreType,
      "changeReasonDetailApply": changeReasonDetailApply,
    };
  }
}
