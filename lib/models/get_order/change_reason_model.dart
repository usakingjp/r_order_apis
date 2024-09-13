class ChangeReasonModel {
  ChangeReasonModel({
    required this.changeId, //変更ID
    this.changeType, //変更種別1
    this.changeTypeDetail, //変更種別(詳細)
    this.changeReason, //変更理由
    this.changeReasonDetail, //変更理由(小分類)
    this.changeApplyDatetime, //変更申請日
    this.changeFixDatetime, //変更確定日
    this.changeCmplDatetime, //変更完了日
  });

  final int changeId;

  // 0: キャンセル申請
  // 1: キャンセル確定
  // 2: キャンセル完了
  // 3: キャンセル取消
  // 4: 変更申請
  // 5: 変更確定
  // 6: 変更完了
  // 7: 変更取消
  // 8: 注文確認
  // 9: 再決済手続き
  int? changeType;

  // 0: 減額
  // 1: 増額
  // 2: その他
  // 10: 支払方法変更
  // 11: 支払方法変更・減額
  // 12: 支払方法変更・増額
  int? changeTypeDetail;

  // 0: 店舗様都合
  // 1: お客様都合
  int? changeReason;

  // 1: キャンセル
  // 2: 受取後の返品
  // 3: 長期不在による受取拒否
  // 4: 未入金
  // 5: 代引決済の受取拒否
  // 6: お客様都合 - その他
  // 8: 欠品
  // 10: 店舗様都合 - その他
  // 13: 発送遅延
  // 14: 顧客・配送対応注意表示
  // 15: 返品(破損・品間違い)
  int? changeReasonDetail;

  // 2017-09-25T20:03:43+0900
  String? changeApplyDatetime;
  String? changeFixDatetime;
  String? changeCmplDatetime;

  ChangeReasonModel.fromJson(Map<String, dynamic> json)
      : changeId = json["changeId"],
        changeType = json["changeType"],
        changeTypeDetail = json["changeTypeDetail"],
        changeReason = json["changeReason"],
        changeReasonDetail = json["changeReasonDetail"],
        changeApplyDatetime = json["changeApplyDatetime"],
        changeFixDatetime = json["changeFixDatetime"],
        changeCmplDatetime = json["changeCmplDatetime"];
}
