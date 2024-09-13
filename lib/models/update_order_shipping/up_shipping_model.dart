class UpShippingModel {
  UpShippingModel({
    this.shippingDetailId,
    this.deliveryCompany,
    this.shippingNumber,
    this.shippingDate,
    this.shippingDeleteFlag,
  });

  /// ・未指定時は発送情報の追加
  /// ・指定時は発送情報の更新、または削除
  final int? shippingDetailId;

  /// 以下のいずれか
  /// 1000: その他
  /// 1001: ヤマト運輸
  /// 1002: 佐川急便
  /// 1003: 日本郵便
  /// 1004: 西濃運輸
  /// 1005: セイノースーパーエクスプレス
  /// 1006: 福山通運
  /// 1007: 名鉄運輸
  /// 1008: トナミ運輸
  /// 1009: 第一貨物
  /// 1010: 新潟運輸
  /// 1011: 中越運送
  /// 1012: 岡山県貨物運送
  /// 1013: 久留米運送
  /// 1014: 山陽自動車運送
  /// 1015: NXトランスポート
  /// 1016: エコ配
  /// 1017: EMS
  /// 1018: DHL
  /// 1019: FedEx
  /// 1020: UPS
  /// 1021: 日本通運
  /// 1022: TNT
  /// 1023: OCS
  /// 1024: USPS
  /// 1025: SFエクスプレス
  /// 1026: Aramex
  /// 1027: SGHグローバル・ジャパン
  /// 1028: Rakuten EXPRESS
  /// ※パラメータなしの場合は値を変更しない
  /// ※パラメータありの場合は値が必須
  final String? deliveryCompany;

  /// 以下の入力チェックが適用されます。
  /// ・機種依存文字などの不正文字以外
  /// ・全角、半角にかかわらず120文字以下
  /// ※パラメータなしの場合は値を変更しない
  /// ※パラメータあり、かつ、値が未指定の場合は設定されている値の削除
  final String? shippingNumber;

  /// YYYY-MM-DD
  /// ※パラメータなしの場合は値を変更しない
  /// ※パラメータあり、かつ、値が未指定の場合は設定されている値の削除
  final String? shippingDate;

  /// 0: 発送情報を削除しない
  /// 1: 発送情報を削除する
  final int? shippingDeleteFlag;

  Map<String, dynamic> toMap() {
    return {
      "shippingDetailId": shippingDetailId,
      "deliveryCompany": deliveryCompany,
      "shippingNumber": shippingNumber,
      "shippingDate": shippingDate,
      "shippingDeleteFlag": shippingDeleteFlag,
    };
  }
}
