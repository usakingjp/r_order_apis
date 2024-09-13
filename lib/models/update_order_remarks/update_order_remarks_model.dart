class UpdateOrderRemarksModel {
  UpdateOrderRemarksModel({
    required this.orderNumber,
    required this.giftCheck,
    required this.remarks,
  });

  /// 注文番号
  final String orderNumber;

  /// ギフト配送
  /// 0: 希望しない
  /// 1: 希望する
  final int? giftCheck;

  /// コメント（備考欄）
  /// ・機種依存文字などの不正文字以外
  /// ・全角、半角にかかわらず4000文字以下
  final String? remarks;

  Map<String, dynamic> toMap() {
    return {
      "orderNumber": orderNumber,
      "giftCheck": giftCheck,
      "remarks": remarks,
    };
  }
}
