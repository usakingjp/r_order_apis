class TaxSummaryModel {
  TaxSummaryModel({
    required this.taxRate, //税率
    required this.reqPrice, //請求金額
    required this.reqPriceTax, //請求額に対する税額
    required this.totalPrice, //合計金額
    required this.paymentCharge, //決済手数料
    required this.couponPrice, //クーポン割引額
    required this.point, //利用ポイント数
  });
  final double taxRate;

  // 税率ごとの請求金額（税込）
  // 以下の場合、-9999になります。
  // ・送料未確定
  // ・代引手数料未確定
  // 注文日が2022年4月1日（金）以降のデータ：商品金額 + 送料 + ラッピング料 + 決済手数料 + 注文者負担金 - クーポン割引額
  // ※利用ポイント数を減算する前に計算
  // <適格請求書等保存方式（インボイス制度）対応>に伴い、2023年9 月14日（木）以降に初回決済確定・発送完了となった注文より、後払い手数料（追加）分が含まれなくなります。
  final int reqPrice;

  // 請求額に対する税額
  // 以下の場合、-9999になります。
  // ・送料未確定
  // ・代引手数料未確定
  // 注文日が2022年4月1日（金）以降のデータ：（商品金額 + 送料 + ラッピング料 + 決済手数料 + 注文者負担金 - クーポン割引額）に対する税額
  // ※利用ポイント数を減算する前の各税額
  // <適格請求書等保存方式（インボイス制度）対応>に伴い、2023年9 月14日（木）以降に初回決済確定・発送完了となった注文より、後払い手数料（追加）分が含まれなくなります。
  final int reqPriceTax;

  // 商品金額 + 送料 + ラッピング料
  // 送料未確定の場合、-9999になります。
  // ※クーポン値引額、利用ポイント数、決済手数料、注文者負担金を含みません。
  final int totalPrice;

  // 代引手数料未確定の場合、-9999になります。
  final int paymentCharge;
  final int couponPrice;

  // 注文日が2022年4月1日（金）以降のデータは常に0
  final int point;

  TaxSummaryModel.fromJson(Map<String, dynamic> json)
      : taxRate = json["taxRate"],
        reqPrice = json["reqPrice"],
        reqPriceTax = json["reqPriceTax"],
        totalPrice = json["totalPrice"],
        paymentCharge = json["paymentCharge"],
        couponPrice = json["couponPrice"],
        point = json["point"];
}
