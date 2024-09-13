class ShippingModel {
  ShippingModel({
    required this.shippingDetailId,
    this.shippingNumber,
    this.deliveryCompany,
    this.deliveryCompanyName,
    this.shippingDate,
  });

  /// 発送明細ID
  // 楽天が発行するIDで更新・削除の場合に利用します
  final int? shippingDetailId;

  /// お荷物伝票番号
  String? shippingNumber;

  /// 配送会社
  // 1000: その他
  // 1001: ヤマト運輸
  // 1002: 佐川急便
  // 1003: 日本郵便
  // 1004: 西濃運輸
  // 1005: セイノースーパーエクスプレス
  // 1006: 福山通運
  // 1007: 名鉄運輸
  // 1008: トナミ運輸
  // 1009: 第一貨物
  // 1010: 新潟運輸
  // 1011: 中越運送
  // 1012: 岡山県貨物運送
  // 1013: 久留米運送
  // 1014: 山陽自動車運送
  // 1015: NXトランスポート
  // 1016: エコ配
  // 1017: EMS
  // 1018: DHL
  // 1019: FedEx
  // 1020: UPS
  // 1021: 日本通運
  // 1022: TNT
  // 1023: OCS
  // 1024: USPS
  // 1025: SFエクスプレス
  // 1026: Aramex
  // 1027: SGHグローバル・ジャパン
  // 1028: Rakuten EXPRESS
  String? deliveryCompany;

  /// 配送会社名
  // 例）ヤマト運輸
  String? deliveryCompanyName;

  /// 発送日
  String? shippingDate;

  ShippingModel.fromJson(Map<String, dynamic> json)
      : shippingDetailId = json["shippingDetailId"],
        shippingNumber = json["shippingNumber"],
        deliveryCompany = json["deliveryCompany"],
        deliveryCompanyName = json["deliveryCompanyName"],
        shippingDate = json["shippingDate"];
  Map<String, dynamic> toMap() {
    return {
      "shippingDetailId": shippingDetailId,
      "shippingNumber": shippingNumber,
      "deliveryCompany": deliveryCompany,
      "deliveryCompanyName": deliveryCompanyName,
      "shippingDate": shippingDate,
    };
  }
}
