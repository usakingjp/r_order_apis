import 'change_reason_model.dart';
import 'coupon_model.dart';
import 'delivery_model.dart';
import 'due_date_model.dart';
import 'orderer_model.dart';
import 'package_model/package_model.dart';
import 'point_model.dart';
import 'settlement_model.dart';
import 'tax_summary_model.dart';
import 'wrapping_model.dart';

class OrderModel {
  OrderModel({
    required this.orderNumber, //注文番号
    required this.orderProgress, //ステータス
    this.subStatusId, //サブステータスID
    this.subStatusName, //サブステータス
    required this.orderDatetime, //注文日時
    this.shopOrderCfmDatetime, //注文確認日時
    this.orderFixDatetime, //注文確定日時
    this.shippingInstDatetime, //発送指示日時
    this.shippingCmplRptDatetime, //発送完了報告日時
    this.cancelDueDate, //キャンセル期限日
    this.deliveryDate, //お届け日指定
    this.shippingTerm, //お届け時間帯
    this.remarks, //コメント
    required this.giftCheckFlag, //ギフト配送希望フラグ
    required this.severalSenderFlag, //複数送付先フラグ
    required this.equalSenderFlag, //送付先一致フラグ
    required this.isolatedIslandFlag, //離島フラグ
    required this.rakutenMemberFlag, //楽天会員フラグ
    required this.carrierCode, //利用端末
    required this.emailCarrierCode, //メールキャリアコード
    required this.orderType, //注文種別
    this.reserveNumber, //申込番号
    this.reserveDeliveryCount, //申込お届け回数
    required this.cautionDisplayType, //警告表示タイプ
    this.cautionDisplayDetailType, //警告表示タイプ詳細
    required this.rakutenConfirmFlag, //楽天確認中フラグ
    required this.goodsPrice, //商品合計金額
    required this.postagePrice, //送料合計
    required this.deliveryPrice, //代引料合計
    required this.paymentCharge, //決済手数料合計
    required this.paymentChargeTaxRate, //決済手続税率
    required this.totalPrice, //合計金額
    required this.requestPrice, //請求金額
    required this.couponAllTotalPrice, //クーポン利用総額
    required this.couponShopPrice, //店舗発行クーポン利用額
    required this.couponOtherPrice, //楽天発行クーポン利用額
    required this.additionalFeeOccurAmountToUser, //注文者負担金合計
    required this.additionalFeeOccurAmountToShop, //店舗負担金合計
    required this.asurakuFlag, //あす楽希望フラグ
    required this.drugFlag, //医薬品受注フラグ
    required this.dealFlag, //楽天スーパーDEAL商品受注フラグ
    required this.membershipType, //メンバーシッププログラム受注タイプ
    this.memo, //ひとことメモ
    this.operator, //担当者
    this.mailPlugSentence, //メール差込文(お客様へのメッセージ)
    required this.modifyFlag, //購入履歴修正有無フラグ
    required this.receiptIssueCount, //領収書発行回数
    this.receiptIssueHistoryList, //領収書発行履歴リスト
    required this.ordererModel, //注文者モデル
    this.settlementModel, //支払方法モデル
    required this.deliveryModel, //配送方法モデル
    this.pointModel, //ポイントモデル
    this.wrappingModel1, //ラッピングモデル1
    this.wrappingModel2, //ラッピングモデル2
    required this.packageModelList, //送付先モデルリスト
    this.couponModelList, //クーポンモデルリスト
    this.changeReasonModelList, //変更・キャンセルモデルリスト
    this.taxSummaryModelList, //税情報モデルリスト
    this.dueDateModelList, //期限日モデルリスト
    required this.deliveryCertPrgFlag, //最強配送フラグ
    required this.oneDayOperationFlag, //注文当日出荷フラグ
  });

  final String orderNumber;
  int orderProgress;
  int? subStatusId;
  String? subStatusName;
  final String orderDatetime;
  String? shopOrderCfmDatetime;
  String? orderFixDatetime;
  String? shippingInstDatetime;
  String? shippingCmplRptDatetime;
  String? cancelDueDate;
  String? deliveryDate;
  int? shippingTerm;
  String? remarks;
  int giftCheckFlag;
  int severalSenderFlag;
  int equalSenderFlag;
  final int isolatedIslandFlag;
  final int rakutenMemberFlag;
  final int carrierCode;
  final int emailCarrierCode;
  final int orderType;
  final String? reserveNumber;
  final int? reserveDeliveryCount;
  final int cautionDisplayType;
  final int? cautionDisplayDetailType;
  int rakutenConfirmFlag;
  int goodsPrice;
  int postagePrice;
  int deliveryPrice;
  int paymentCharge;
  double paymentChargeTaxRate;
  int totalPrice;
  int requestPrice;
  final int couponAllTotalPrice;
  final int couponShopPrice;
  final int couponOtherPrice;
  int additionalFeeOccurAmountToUser;
  int additionalFeeOccurAmountToShop;
  final int asurakuFlag;
  final int drugFlag;
  final int dealFlag;
  final int membershipType;
  String? memo;
  String? operator;
  String? mailPlugSentence;
  final int modifyFlag;
  int receiptIssueCount;
  List<String>? receiptIssueHistoryList;
  OrdererModel ordererModel;
  SettlementModel? settlementModel;
  DeliveryModel deliveryModel;
  PointModel? pointModel;
  WrappingModel? wrappingModel1;
  WrappingModel? wrappingModel2;
  List<PackageModel> packageModelList;
  List<CouponModel>? couponModelList;
  List<ChangeReasonModel>? changeReasonModelList;
  List<TaxSummaryModel>? taxSummaryModelList;
  List<DueDateModel>? dueDateModelList;
  final int deliveryCertPrgFlag;
  final int oneDayOperationFlag;

  OrderModel.fromJson(Map<String, dynamic> json)
      : orderNumber = json["orderNumber"],
        orderProgress = json["orderProgress"],
        subStatusId = json["subStatusId"],
        orderDatetime = json["orderDatetime"],
        shopOrderCfmDatetime = json["shopOrderCfmDatetime"],
        orderFixDatetime = json["orderFixDatetime"],
        shippingInstDatetime = json["shippingInstDatetime"],
        shippingCmplRptDatetime = json["shippingCmplRptDatetime"],
        cancelDueDate = json["cancelDueDate"],
        deliveryDate = json["deliveryDate"],
        shippingTerm = json["shippingTerm"],
        remarks = json["remarks"],
        giftCheckFlag = json["giftCheckFlag"],
        severalSenderFlag = json["severalSenderFlag"],
        equalSenderFlag = json["equalSenderFlag"],
        isolatedIslandFlag = json["isolatedIslandFlag"],
        rakutenMemberFlag = json["rakutenMemberFlag"],
        carrierCode = json["carrierCode"],
        emailCarrierCode = json["emailCarrierCode"],
        orderType = json["orderType"],
        reserveNumber = json["reserveNumber"],
        reserveDeliveryCount = json["reserveDeliveryCount"],
        cautionDisplayType = json["cautionDisplayType"],
        cautionDisplayDetailType = json["cautionDisplayDetailType"],
        rakutenConfirmFlag = json["rakutenConfirmFlag"],
        goodsPrice = json["goodsPrice"],
        postagePrice = json["postagePrice"],
        deliveryPrice = json["deliveryPrice"],
        paymentCharge = json["paymentCharge"],
        paymentChargeTaxRate = json["paymentChargeTaxRate"],
        totalPrice = json["totalPrice"],
        requestPrice = json["requestPrice"],
        couponAllTotalPrice = json["couponAllTotalPrice"],
        couponShopPrice = json["couponShopPrice"],
        couponOtherPrice = json["couponOtherPrice"],
        additionalFeeOccurAmountToUser = json["additionalFeeOccurAmountToUser"],
        additionalFeeOccurAmountToShop = json["additionalFeeOccurAmountToShop"],
        asurakuFlag = json["asurakuFlag"],
        drugFlag = json["drugFlag"],
        dealFlag = json["dealFlag"],
        membershipType = json["membershipType"],
        memo = json["memo"],
        operator = json["operator"],
        mailPlugSentence = json["mailPlugSentence"],
        modifyFlag = json["modifyFlag"],
        receiptIssueCount = json["receiptIssueCount"],
        receiptIssueHistoryList = [
          for (var e in json["receiptIssueHistoryList"]) e.toString()
        ],
        ordererModel = OrdererModel.fromJson(json["OrdererModel"]),
        settlementModel = SettlementModel.fromJson(json["SettlementModel"]),
        deliveryModel = DeliveryModel.fromJson(json["DeliveryModel"]),
        pointModel = (json["PointModel"] != null)
            ? PointModel.fromJson(json["PointModel"])
            : null,
        wrappingModel1 = (json["WrappingModel1"] != null)
            ? WrappingModel.fromJson(json["WrappingModel1"])
            : null,
        wrappingModel2 = (json["WrappingModel2"] != null)
            ? WrappingModel.fromJson(json["WrappingModel2"])
            : null,
        packageModelList = [
          for (Map<String, dynamic> e in json["PackageModelList"])
            PackageModel.fromJson(e)
        ],
        couponModelList = (json["CouponModelList"] != null)
            ? [
                for (Map<String, dynamic> e in json["CouponModelList"])
                  CouponModel.fromJson(e)
              ]
            : null,
        changeReasonModelList = (json["ChangeReasonModelList"] != null)
            ? [
                for (Map<String, dynamic> e in json["ChangeReasonModelList"])
                  ChangeReasonModel.fromJson(e)
              ]
            : null,
        taxSummaryModelList = (json["TaxSummaryModelList"] != null)
            ? [
                for (Map<String, dynamic> e in json["TaxSummaryModelList"])
                  TaxSummaryModel.fromJson(e)
              ]
            : null,
        dueDateModelList = [
          for (Map<String, dynamic> e in json["DueDateModelList"])
            DueDateModel.fromJson(e)
        ],
        deliveryCertPrgFlag = json["deliveryCertPrgFlag"],
        oneDayOperationFlag = json["oneDayOperationFlag"];
}
