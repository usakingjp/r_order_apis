import '../get_order/coupon_model.dart';
import '../get_order/package_model/package_model.dart';
import '../get_order/wrapping_model.dart';

class UpdateOrderSenderModel {
  UpdateOrderSenderModel({
    required this.orderNumber,
    this.reductionReason,
    this.wrappingModel1,
    this.wrappingModel2,
    required this.packageModelList,
    this.couponModelList,
    this.afterSettlementMethodCode,
  });

  /// 注文番号
  final String orderNumber;

  /// 変更理由
  /// (お客様都合による)
  /// 1: キャンセル
  /// 2: 受取後の返品
  /// 3: 長期不在による受取拒否
  /// 4: 未入金
  /// 5: 代引決済の受取拒否
  /// 6: その他
  ///
  /// (店舗都合による)
  /// 8: 欠品
  /// 10: その他
  /// 13: 発送遅延
  /// 14: 顧客・配送対応注意表示
  /// 15: 返品（破損・品間違い）
  ///
  /// ※減額する場合は必須
  final int? reductionReason;

  /// ラッピングモデル
  /// ラッピング指定がある場合は必須。
  final WrappingModel? wrappingModel1;
  final WrappingModel? wrappingModel2;

  /// 送付先モデルリスト
  final List<PackageModel> packageModelList;

  /// クーポンモデルリスト
  /// クーポン利用注文の場合に指定が必要。
  final List<CouponModel>? couponModelList;

  /// 変更後支払方法コード
  /// 2: 代金引換
  // 4: ショッピングクレジット／ローン
  // 5: オートローン
  // 6: リース
  // 7: 請求書払い
  // 9: 銀行振込
  // 13: セブンイレブン（前払）
  // 14: ローソン、郵便局ATM等（前払）
  // 16: Alipay
  // 27: Alipay（支付宝）

  // ・ステータスが「100: 注文確認待ち」または決済ステータスが「30400: 決済手続きNG」の場合のみ変更可能。
  // ・ステータスが「100: 注文確認待ち」の場合は各種金額、その他項目が同時に変更可能。
  // ・決済ステータスが「30400: 決済手続きNG」で市場共通決済（「9: 銀行振込」「13: セブンイレブン（前払）」「14: ローソン、郵便局ATM等（前払）」「16: Alipay」）の場合は各種金額は変更不可。
  // ・決済ステータスが「30400: 決済手続きNG」で選択制決済（「2: 代金引換」「4: ショッピングクレジット／ローン」「5: オートローン」「6: リース」「7: 請求書払い」）の場合は「送料」「代引料」のみ金額変更可能。「代引手数料込別」は変更不可。
  // ・増額した結果が「30400: 決済手続きNG」になった場合は変更不可。
  final int? afterSettlementMethodCode;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {
      "orderNumber": orderNumber,
      "PackageModelList": [
        for (PackageModel e in packageModelList) e.toUpdateMap()
      ],
    };
    if (reductionReason != null) {
      result.addAll({"reductionReason": reductionReason});
    }
    if (wrappingModel1 != null) {
      result.addAll({"WrappingModel1": wrappingModel1!.toUpdateMap()});
    }
    if (reductionReason != null) {
      result.addAll({"WrappingModel2": wrappingModel2!.toUpdateMap()});
    }
    if (couponModelList != null) {
      result.addAll({
        "CouponModelList": [
          for (CouponModel e in couponModelList!) e.toUpdateMap()
        ]
      });
    }
    if (afterSettlementMethodCode != null) {
      result.addAll({"afterSettlementMethodCode": afterSettlementMethodCode});
    }
    return result;
  }
}
