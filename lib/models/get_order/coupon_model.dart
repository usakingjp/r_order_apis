class CouponModel {
  CouponModel({
    required this.couponCode, //クーポンコード
    required this.itemId, //クーポン対象の商品ID
    required this.couponName, //クーポン名
    required this.couponSummary, //クーポン効果(サマリー)
    required this.couponCapital, //クーポン原資
    required this.couponCapitalCode, //クーポン原資コード
    required this.expiryDate, //有効期限
    required this.couponPrice, //クーポン割引単価
    required this.couponUnit, //クーポン利用数
    required this.couponTotalPrice, //クーポン利用金額
    required this.itemDetailId, //商品明細ID
  });

  final String couponCode;

  // 該当する商品がない場合は 0 が指定されます。
  final int itemId;
  final String couponName;
  final String couponSummary;

  // ショップ
  // メーカー
  // サービス
  final String couponCapital;

  // 1：ショップ
  // 2：メーカー
  // 3：サービス
  final int couponCapitalCode;

  // 日付のみ取得可能です。時分秒は無効な値です。
  final String expiryDate;
  final int couponPrice;
  final int couponUnit;

  // クーポン割引単価×クーポン利用数
  final int couponTotalPrice;

  // 商品指定クーポンの場合：対象商品のitemDetailId
  // 商品指定クーポン以外の場合：0
  final int? itemDetailId;

  CouponModel.fromJson(Map<String, dynamic> json)
      : couponCode = json["couponCode"],
        itemId = json["itemId"],
        couponName = json["couponName"],
        couponSummary = json["couponSummary"],
        couponCapital = json["couponCapital"],
        couponCapitalCode = json["couponCapitalCode"],
        expiryDate = json["expiryDate"],
        couponPrice = json["couponPrice"],
        couponUnit = json["couponUnit"],
        couponTotalPrice = json["couponTotalPrice"],
        itemDetailId = json["itemDetailId"];

  Map<String, dynamic> toMap() {
    return {
      "couponCode": couponCode,
      "itemId": itemId,
      "couponName": couponName,
      "couponSummary": couponSummary,
      "couponCapital": couponCapital,
      "couponCapitalCode": couponCapitalCode,
      "expiryDate": expiryDate,
      "couponPrice": couponPrice,
      "couponUnit": couponUnit,
      "couponTotalPrice": couponTotalPrice,
      "itemDetailId": itemDetailId,
    };
  }

  Map<String, dynamic> toUpdateMap() {
    return {
      "couponCode": couponCode,
      "couponPrice": couponPrice,

      /// 利用数を増やす事はできません
      "couponUnit": couponUnit,

      /// 割引対象の商品IDを指定。商品限定クーポンではない場合、0 を指定して下さい。
      "itemId": itemId,
    };
  }
}
