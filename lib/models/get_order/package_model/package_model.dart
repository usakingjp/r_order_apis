import 'delivery_cvs_model.dart';
import 'item_model.dart';
import 'sender_model.dart';
import 'shipping_model.dart';

class PackageModel {
  PackageModel({
    required this.basketId, //送付先ID
    required this.postagePrice, //送料
    required this.postageTaxRate, //送料税率
    required this.deliveryPrice, //代引料
    required this.deliveryTaxRate, //代引料税率
    required this.goodsPrice, //商品合計金額
    required this.totalPrice, //合計金額
    this.noshi, //のし
    required this.packageDeleteFlag, //送付先モデル削除フラグ
    required this.senderModel, //送付者モデル
    required this.itemModelList, //商品モデルリスト
    this.shippingModelList, //発送モデルリスト
    this.deliveryCVSModel, //コンビニ配送モデル
    required this.defaultDeliveryCompanyCode, //購入時配送会社
  });
  final int basketId;

  //送付先に紐付く送料 （R-StoreFrontで指定した送料設定に準拠）
  // ※未設定の場合、-9999になります。
  int postagePrice;
  final double postageTaxRate;

  // ※未設定の場合、-9999になります
  int deliveryPrice;
  final double deliveryTaxRate;

  // 送付先に紐付く
  // 商品金額 + ラッピング料
  int goodsPrice;

  // 送付先に紐付く
  // 商品金額 + 送料 + ラッピング料
  // ※代引手数料は含まれません。
  // ※未確定の場合、-9999になります。
  int totalPrice;
  String? noshi;

  // 0: 送付先モデルを削除しない
  // 1: 送付先モデルを削除する
  final int packageDeleteFlag;
  SenderModel senderModel;
  List<ItemModel> itemModelList;
  List<ShippingModel>? shippingModelList;

  // 配送方法がコンビニ、郵便局受取の場合、参照可能。
  DeliveryCVSModel? deliveryCVSModel;

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
  final String defaultDeliveryCompanyCode;
  PackageModel.fromJson(Map<String, dynamic> json)
      : basketId = json["basketId"],
        postagePrice = json["postagePrice"],
        postageTaxRate = json["postageTaxRate"],
        deliveryPrice = json["deliveryPrice"],
        deliveryTaxRate = json["deliveryTaxRate"],
        goodsPrice = json["goodsPrice"],
        totalPrice = json["totalPrice"],
        noshi = json["noshi"],
        packageDeleteFlag = json["packageDeleteFlag"],
        senderModel = SenderModel.fromJson(json["SenderModel"]),
        itemModelList = [
          for (Map<String, dynamic> e in json["ItemModelList"])
            ItemModel.fromJson(e)
        ],
        shippingModelList = (json["ShippingModelList"] != null)
            ? [
                for (Map<String, dynamic> e in json["ShippingModelList"])
                  ShippingModel.fromJson(e)
              ]
            : null,
        deliveryCVSModel = (json["DeliveryCVSModel"] != null)
            ? DeliveryCVSModel.fromJson(json["DeliveryCVSModel"])
            : null,
        defaultDeliveryCompanyCode = json["defaultDeliveryCompanyCode"];
  Map<String, dynamic> toMap() {
    return {
      "basketId": basketId,
      "postagePrice": postagePrice,
      "postageTaxRate": postageTaxRate,
      "deliveryPrice": deliveryPrice,
      "deliveryTaxRate": deliveryTaxRate,
      "goodsPrice": goodsPrice,
      "totalPrice": totalPrice,
      "noshi": noshi,
      "packageDeleteFlag": packageDeleteFlag,
      "SenderModel": senderModel.toMap(),
      "ItemModelList": [for (ItemModel e in itemModelList) e.toMap()],
      "ShippingModelList": (shippingModelList != null)
          ? [for (ShippingModel e in shippingModelList!) e.toMap()]
          : null,
      "DeliveryCVSModel":
          (deliveryCVSModel != null) ? deliveryCVSModel!.toMap() : null,
      "defaultDeliveryCompanyCode": defaultDeliveryCompanyCode,
    };
  }

  Map<String, dynamic> toUpdateMap() {
    return {
      "basketId": basketId,
      "postagePrice": postagePrice,
      "postageTaxRate": postageTaxRate,
      "deliveryPrice": deliveryPrice,
      "deliveryTaxRate": deliveryTaxRate,
      "noshi": noshi,
      "packageDeleteFlag": packageDeleteFlag,
      "SenderModel": senderModel.toMap(),
      "ItemModelList": [for (ItemModel e in itemModelList) e.toUpdateMap()],
    };
  }
}
