import 'sku_model.dart';

class ItemModel {
  ItemModel({
    required this.itemDetailId, //商品明細ID
    required this.itemName, //商品名
    required this.itemId, //商品ID
    this.itemNumber, //商品番号
    required this.manageNumber, //商品管理番号
    required this.price, //単価
    required this.units, //個数
    required this.includePostageFlag, //送料込別
    required this.includeTaxFlag, //税込別
    required this.includeCashOnDeliveryPostageFlag, //代引手数料込別
    this.selectedChoice, //項目・選択肢
    required this.pointRate, //ポイント倍率
    required this.pointType, //ポイントタイプ
    required this.inventoryType, //在庫タイプ
    this.delvdateInfo, //納期情報
    required this.restoreInventoryFlag, //在庫連動オプション
    required this.dealFlag, //楽天スーパーDEAL商品フラグ
    required this.drugFlag, //医薬品フラグ
    required this.deleteItemFlag, //商品削除フラグ
    required this.taxRate, //商品税率
    required this.priceTaxIncl, //商品毎税込価格
    required this.isSingleItemShipping, //単品配送フラグ
    required this.skuModelList, //SKUモデルリスト
  });
  final int itemDetailId;
  String itemName;
  final int itemId;

  //項目選択肢別在庫が指定された商品の場合、以下のルールで値が表示されます
  //SKU移行前注文：商品番号（店舗様が登録した番号）＋項目選択肢ID（横軸）＋項目選択肢ID（縦軸）
  //SKU移行後注文：商品番号（店舗様が登録した番号
  final String? itemNumber;
  final String manageNumber;
  int price;
  int units;

  // 0: 送料別
  // 1: 送料込みもしくは送料無料
  int includePostageFlag;

  // 0: 税別
  // 1: 税込み
  int includeTaxFlag;

  // 0: 代引手数料別
  // 1: 代引手数料込み
  int includeCashOnDeliveryPostageFlag;

  // HTMLタグ除去済み。
  // 項目選択肢、項目選択肢別在庫が指定された商品が購入された注文の場合、以下のルールで値が入ります。
  // SKU移行前注文：項目選択肢情報、項目選択肢別在庫情報が入ります。
  // SKU移行後注文：項目選択肢情報は引き続き入ります。
  final String? selectedChoice;

  // ポイントレート
  final int pointRate;

  // 0: 変倍なし
  // 1: 店舗別変倍
  // 2: 商品別変倍
  // -99: エラー時無効値
  final int pointType;

  // 0: 在庫設定なし
  // 1: 通常在庫設定
  // 2: 項目選択肢在庫設定
  final int inventoryType;
  final String? delvdateInfo;

  // 0: 商品の設定に従う
  // 1: 在庫連動する
  // 2: 在庫連動しない
  final int restoreInventoryFlag;

  // 0: 楽天スーパーディール商品ではない
  // 1: 楽天スーパーディール商品である
  final int dealFlag;

  // 0: 医薬品ではない
  // 1: 医薬品である
  final int drugFlag;

  // 0: 商品を削除しない
  // 1: 商品を削除する
  final int deleteItemFlag;
  final double taxRate;

  // ・税込商品の場合：
  //   商品単価＝商品毎税込価格
  // ・税別商品の場合：
  //   商品単価＝税別価格
  //   商品毎税込単価＝税込価格（商品単価 * (1+税率））
  //   端数処理は、店舗設定に準ずる
  int priceTaxIncl;

  // 0: 単品配送ではない
  // 1: 単品配送である
  final int isSingleItemShipping;
  final List<SkuModel> skuModelList;

  ItemModel.fromJson(Map<String, dynamic> json)
      : itemDetailId = json["itemDetailId"],
        itemName = json["itemName"],
        itemId = json["itemId"],
        itemNumber = json["itemNumber"],
        manageNumber = json["manageNumber"],
        price = json["price"],
        units = json["units"],
        includePostageFlag = json["includePostageFlag"],
        includeTaxFlag = json["includeTaxFlag"],
        includeCashOnDeliveryPostageFlag =
            json["includeCashOnDeliveryPostageFlag"],
        selectedChoice = json["selectedChoice"],
        pointRate = json["pointRate"],
        pointType = json["pointType"],
        inventoryType = json["inventoryType"],
        delvdateInfo = json["delvdateInfo"],
        restoreInventoryFlag = json["restoreInventoryFlag"],
        dealFlag = json["dealFlag"],
        drugFlag = json["drugFlag"],
        deleteItemFlag = json["deleteItemFlag"],
        taxRate = json["taxRate"],
        priceTaxIncl = json["priceTaxIncl"],
        isSingleItemShipping = json["isSingleItemShipping"],
        skuModelList = [
          for (Map<String, dynamic> e in json["SkuModelList"])
            SkuModel.fromJson(e)
        ];
  Map<String, dynamic> toMap() {
    return {
      "itemDetailId": itemDetailId,
      "itemName": itemName,
      "itemId": itemId,
      "itemNumber": itemNumber,
      "manageNumber": manageNumber,
      "price": price,
      "units": units,
      "includePostageFlag": includePostageFlag,
      "includeTaxFlag": includeTaxFlag,
      "includeCashOnDeliveryPostageFlag": includeCashOnDeliveryPostageFlag,
      "selectedChoice": selectedChoice,
      "pointRate": pointRate,
      "pointType": pointType,
      "inventoryType": inventoryType,
      "delvdateInfo": delvdateInfo,
      "restoreInventoryFlag": restoreInventoryFlag,
      "dealFlag": dealFlag,
      "drugFlag": drugFlag,
      "deleteItemFlag": deleteItemFlag,
      "taxRate": taxRate,
      "priceTaxIncl": priceTaxIncl,
      "isSingleItemShipping": isSingleItemShipping,
      "skuModelList": [for (SkuModel e in skuModelList) e.toMap()],
    };
  }

  Map<String, dynamic> toUpdateMap() {
    return {
      "itemDetailId": itemDetailId,
      "itemName": itemName,
      "itemNumber": itemNumber,
      "price": price,
      "taxRate": taxRate,
      "units": units,
      "includePostageFlag": includePostageFlag,
      "includeTaxFlag": includeTaxFlag,
      "includeCashOnDeliveryPostageFlag": includeCashOnDeliveryPostageFlag,
      "selectedChoice": selectedChoice,
      "deleteItemFlag": deleteItemFlag,
      "skuModelList": [for (SkuModel e in skuModelList) e.toMap()],
    };
  }
}
