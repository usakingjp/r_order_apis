class WrappingModel {
  WrappingModel({
    required this.title, // ラッピングタイトル
    required this.name, //ラッピング名
    this.price, //料金
    required this.includeTaxFlag, //税込別
    required this.deleteWrappingFlag, //ラッピング削除フラグ
    required this.taxRate, //ラッピング税率
    required this.taxPrice, //ラッピング税額
  });

  // 1: 包装紙
  // 2: リボン
  final int title;
  String name;
  int? price;

  // 0: 税別
  // 1: 税込
  final int includeTaxFlag;
  final int deleteWrappingFlag;
  final double taxRate;
  int taxPrice;
  WrappingModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        name = json["name"],
        price = json["price"],
        includeTaxFlag = json["includeTaxFlag"],
        deleteWrappingFlag = json["deleteWrappingFlag"],
        taxRate = json["taxRate"],
        taxPrice = json["taxPrice"];

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "name": name,
      "price": price,
      "includeTaxFlag": includeTaxFlag,
      "deleteWrappingFlag": deleteWrappingFlag,
      "taxRate": taxRate,
      "taxPrice": taxPrice,
    };
  }

  Map<String, dynamic> toUpdateMap() {
    return {
      "title": title,
      "name": name,
      "price": price,
      "taxRate": taxRate,
      "includeTaxFlag": includeTaxFlag,
      "deleteWrappingFlag": deleteWrappingFlag,
    };
  }
}
