import 'pagination_request_model.dart';

class SearchOrderModel {
  SearchOrderModel({
    required this.dateType,
    required this.startDatetime,
    required this.endDatetime,
    this.orderProgressList,
    this.subStatusIdList,
    this.orderTypeList,
    this.settlementMethod,
    this.deliveryName,
    this.shippingDateBlankFlag,
    this.shippingNumberBlankFlag,
    this.searchKeywordType,
    this.searchKeyword,
    this.mailSendType,
    this.ordererMailAddress,
    this.phoneNumberType,
    this.phoneNumber,
    this.reserveNumber,
    this.purchaseSiteType,
    this.asurakuFlag,
    this.couponUseFlag,
    this.drugFlag,
    this.oneDayOperationFlag,
  }) : paginationRequestModel = PaginationRequestModel(
          requestRecordsAmount: 30,
          requestPage: 1,
        );

  ///期間検索種別
  final int dateType;

  /// 期間検索開始日時
  /// yyyy-MM-ddTHH:mm:ss+0900
  final String startDatetime;

  /// 期間検索終了日時
  /// yyyy-MM-ddTHH:mm:ss+0900
  final String endDatetime;

  /// ステータスリスト
  // 100: 注文確認待ち
  // 200: 楽天処理中
  // 300: 発送待ち
  // 400: 変更確定待ち
  // 500: 発送済
  // 600: 支払手続き中
  // 700: 支払手続き済
  // 800: キャンセル確定待ち
  // 900: キャンセル確定
  final List<int>? orderProgressList;

  /// サブステータスIDリスト
  // 作成されたサブステータスを指定する場合は複数のIDを同時に指定することが可能です。
  // [-1]を指定した場合、サブステータスが設定されていない注文を取得することが可能です。[-1]を指定する場合、ステータスリスト（orderProgressList）の指定が必須となります。
  final List<int>? subStatusIdList;

  /// 販売種別リスト
  // 1: 通常購入
  // 4: 定期購入
  // 5: 頒布会
  // 6: 予約商品
  final List<int>? orderTypeList;

  /// 支払方法名
  // 1: クレジットカード
  // 2: 代金引換
  // 3: 後払い
  // 4: ショッピングクレジット／ローン
  // 5: オートローン
  // 6: リース
  // 7: 請求書払い
  // 9: 銀行振込
  // 12: Apple Pay
  // 13: セブンイレブン（前払）
  // 14: ローソン、郵便局ATM等（前払）
  // 16: Alipay
  // 17: PayPal
  // 21: 後払い決済（楽天市場の共通決済）
  // 27: Alipay（支付宝）
  final int? settlementMethod;

  /// 配送方法
  // 宅配便など
  final String? deliveryName;

  /// 発送日未指定有無フラグ
  // 0: 発送日の指定の有無によらず取得
  // 1: 発送日が未指定のものだけを取得
  final int? shippingDateBlankFlag;

  /// お荷物伝票番号未指定有無フラグ
  // 0: お荷物伝票番号の指定の有無によらず取得
  // 1: お荷物伝票番号が未指定のものだけを取得
  final int? shippingNumberBlankFlag;

  /// 検索キーワード種別
  // 0: なし
  // 1: 商品名
  // 2: 商品番号
  // 3: ひとことメモ
  // 4: 注文者氏名
  // 5: 注文者氏名フリガナ
  // 6: 送付先氏名
  // 7: SKU管理番号
  // 8: システム連携用SKU番号
  // 9: SKU情報
  final int? searchKeywordType;

  /// 検索キーワード
  // ・機種依存文字などの不正文字以外
  // ・キーワード前後の空白は削除
  // ・全角、半角にかかわらず、それぞれのキーワードの文字数は下記のとおり

  // 1: 商品名：1024 文字以下
  // 2: 商品番号：127文字以下
  // 3: ひとことメモ：1000文字以下
  // 4: 注文者氏名：254文字以下
  // 5: 注文者氏名フリガナ：254文字以下
  // 6: 送付先氏名：254文字以下
  // 7: SKU管理番号：40文字以下
  // 8: システム連携用SKU番号：96文字以下
  // 9: SKU情報：400文字以下
  final String? searchKeyword;

  /// 注文メールアドレス種別
  // 0: PC/モバイル
  // 1: PC
  // 2: モバイル
  final int? mailSendType;

  /// 注文者メールアドレス
  final String? ordererMailAddress;

  /// 電話番号種別
  // 1: 注文者
  // 2: 送付先
  final int? phoneNumberType;

  /// 電話番号
  final String? phoneNumber;

  /// 申込番号
  final String? reserveNumber;

  /// 購入サイトリスト
  final int? purchaseSiteType;

  /// あす楽希望フラグ
  /// 0: あす楽希望の有無によらず取得
  /// 1: あす楽希望のものだけを取得
  final int? asurakuFlag;

  /// クーポン利用有無フラグ
  /// 0: クーポン利用の有無によらず取得
  /// 1: クーポン利用のものだけを取得
  final int? couponUseFlag;

  /// 医薬品受注フラグ
  /// 0: 医薬品の有無によらず取得
  /// 1: 医薬品を含む注文だけを取得
  final int? drugFlag;

  /// 注文当日出荷フラグ
  /// 0: 注文当日出荷によらず取得
  /// 1: 注文当日出荷のものだけを取得
  /// ※購入時に最短お届け可能日が指定された注文です。
  final int? oneDayOperationFlag;

  late PaginationRequestModel paginationRequestModel;

  void changePage(int i) {
    paginationRequestModel.requestPage = i;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {
      "dateType": dateType,
      "startDatetime": startDatetime,
      "endDatetime": endDatetime,
      "orderProgressList": orderProgressList,
      "subStatusIdList": subStatusIdList,
      "orderTypeList": orderTypeList,
      "settlementMethod": settlementMethod,
      "deliveryName": deliveryName,
      "shippingDateBlankFlag": shippingDateBlankFlag,
      "shippingNumberBlankFlag": shippingNumberBlankFlag,
      "searchKeywordType": searchKeywordType,
      "searchKeyword": searchKeyword,
      "mailSendType": mailSendType,
      "ordererMailAddress": ordererMailAddress,
      "phoneNumberType": phoneNumberType,
      "phoneNumber": phoneNumber,
      "reserveNumber": reserveNumber,
      "purchaseSiteType": purchaseSiteType,
      "asurakuFlag": asurakuFlag,
      "couponUseFlag": couponUseFlag,
      "drugFlag": drugFlag,
      "oneDayOperationFlag": oneDayOperationFlag,
      "PaginationRequestModel": paginationRequestModel.toMap(),
    };
    return result;
  }
}
