class SettlementModel {
  SettlementModel({
    required this.settlementMethodCode, //支払方法コード
    required this.settlementMethod, //支払方法名
    required this.rpaySettlementFlag, //楽天市場の共通決済手段フラグ
    this.cardName, //クレジットカード種類
    this.cardNumber, //クレジットカード番号
    this.cardOwner, //クレジットカード名義人
    this.cardYm, //クレジットカード有効期限
    this.cardPayType, //クレジットカード支払い方法
    this.cardInstallmentDesc, //クレジットカード支払い回数
  });

  // 1: クレジットカード
  // 2: 代金引換
  // 4: ショッピングクレジット／ローン
  // 5: オートローン
  // 6: リース
  // 7: 請求書払い
  // 8: ポイント
  // 9: 銀行振込
  // 12: Apple Pay
  // 13: セブンイレブン（前払）
  // 14: ローソン、郵便局ATM等（前払）
  // 16: Alipay
  // 17: PayPal
  // 21: 後払い決済
  // 27: Alipay（支付宝）
  final int settlementMethodCode;
  final String settlementMethod;

  // 0: 選択制決済
  // 1: 楽天市場の共通決済手段
  final int rpaySettlementFlag;
  final String? cardName;
  final String? cardNumber;
  final String? cardOwner;
  final String? cardYm;

  // 0: 一括払い
  // 1: リボ払い
  // 2: 分割払い
  // 3: その他払い
  // 4: ボーナス一括払い
  final int? cardPayType;

  // 103:  3回払い
  // 105:  5回払い
  // 106:  6回払い
  // 110: 10回払い
  // 112: 12回払い
  // 115: 15回払い
  // 118: 18回払い
  // 120: 20回払い
  // 124: 24回払い
  final String? cardInstallmentDesc;
  SettlementModel.fromJson(Map<String, dynamic> json)
      : settlementMethodCode = json["settlementMethodCode"],
        settlementMethod = json["settlementMethod"],
        rpaySettlementFlag = json["rpaySettlementFlag"],
        cardName = json["cardName"],
        cardNumber = json["cardNumber"],
        cardOwner = json["cardOwner"],
        cardYm = json["cardYm"],
        cardPayType = json["cardPayType"],
        cardInstallmentDesc = json["cardInstallmentDesc"];
}
