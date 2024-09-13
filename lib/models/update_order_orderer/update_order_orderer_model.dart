import '../get_order/orderer_model.dart';

class UpdateOrderOrdererModel {
  UpdateOrderOrdererModel({
    required this.orderNumber,
    this.reductionReason,
    required this.ordererModel,
  });

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
  /// ※以下の条件で必須。
  /// 1. 減額変更時
  /// 2. 楽天市場共通の後払い決済　かつ　発送完了報告後の変更時
  final int? reductionReason;

  final OrdererModel ordererModel;

  Map<String, dynamic> toMap() {
    return {
      "orderNumber": orderNumber,
      "reductionReason": reductionReason,
      "ordererModel": ordererModel.toMap(),
    };
  }
}
