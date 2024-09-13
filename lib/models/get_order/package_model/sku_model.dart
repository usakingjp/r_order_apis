class SkuModel {
  SkuModel({
    required this.variantId, //SKU管理番号
    this.merchantDefinedSkuId, //システム連携用SKU番号
    this.skuInfo, //SKU情報
  });

  // SKU移行前の注文の場合、値は空になります。
  final String variantId;

  // SKU移行前の注文の場合、値は空になります。
  final String? merchantDefinedSkuId;

  // 以下のルールで値が入ります。
  // SKU移行前注文：値は空になります。
  // SKU移行後注文：バリエーション項目名・バリエーション選択肢（旧・項目選択肢別在庫情報）が入ります。
  final String? skuInfo;
  SkuModel.fromJson(Map<String, dynamic> json)
      : variantId = json["variantId"],
        merchantDefinedSkuId = json["merchantDefinedSkuId"],
        skuInfo = json["skuInfo"];
  Map<String, dynamic> toMap() {
    return {
      "variantId": variantId,
      "merchantDefinedSkuId": merchantDefinedSkuId,
      "skuInfo": skuInfo,
    };
  }
}
