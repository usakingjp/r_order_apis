class UpdateOrderMemoModel {
  UpdateOrderMemoModel({
    required this.orderNumber,
    required this.subStatusId,
    required this.deliveryClass,
    required this.deliveryDate,
    required this.shippingTerm,
    required this.memo,
    required this.operator,
    required this.mailPlugSentence,
  });

  /// 注文番号
  final String orderNumber;

  /// サブステータスID
  final int? subStatusId;

  /// 配送区分
  /// 「利用サービス名」のうち以下のいずれか
  /// 0: 選択なし
  /// 1: 普通
  /// 2: 冷蔵
  /// 3: 冷凍
  /// 4: その他1
  /// 5: その他2
  /// 6: その他3
  /// 7: その他4
  /// 8: その他5
  final int? deliveryClass;

  /// お届け日指定
  /// YYYY-MM-DD
  final String? deliveryDate;

  /// お届け時間帯
  /// 以下のいずれか
  /// 0: なし
  /// 1: 午前
  /// 2: 午後
  /// 9: その他
  // h1h2: h1時-h2時 (h1は7～24まで任意で数値指定可能。h2は07～24まで任意で数値指定可能)
  final int? shippingTerm;

  /// ひとことメモ
  /// 以下の入力チェックが適用されます
  /// ・機種依存文字などの不正文字以外
  /// ・全角、半角にかかわらず1000文字以下
  final String? memo;

  /// 担当者
  /// 以下の入力チェックが適用されます
  /// ・機種依存文字などの不正文字以外
  /// ・全角、半角にかかわらず6文字以下
  final String? operator;

  /// メール差込文(お客様へのメッセージ)
  /// 以下の入力チェックが適用されます
  /// ・機種依存文字などの不正文字以外
  /// ・全角、半角にかかわらず1024文字以下
  final String? mailPlugSentence;

  Map<String, dynamic> toMap() {
    return {
      "orderNumber": orderNumber,
      "subStatusId": subStatusId,
      "deliveryClass": deliveryClass,
      "deliveryDate": deliveryDate,
      "shippingTerm": shippingTerm,
      "memo": memo,
      "operator": operator,
      "mailPlugSentence": mailPlugSentence,
    };
  }
}
