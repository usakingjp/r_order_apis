class DeliveryCVSModel {
  DeliveryCVSModel({
    this.cvsCode, // コンビニコード
    this.storeGenreCode, // ストア分類コード
    this.storeCode, // ストアコード
    this.storeName, // ストア名称
    this.storeZip, // 郵便番号
    this.storePrefecture, // 都道府県
    this.storeAddress, // その他住所4
    this.areaCode, // 発注エリアコード
    this.depo, // センターデポコード
    this.openTime, // 開店時間
    this.closeTime, // 閉店時間
    this.cvsRemarks, // 特記事項
  });

  // 1: ファミリーマート
  // 20: ミニストップ
  // 40: サークルK
  // 41: サンクス
  // 50: ローソン
  // 60: 郵便局
  // 70: スリーエフ
  // 71: エブリワン
  // 72: ココストア
  // 74: セーブオン
  // 80: デイリーヤマザキ
  // 81: ヤマザキデイリーストア
  // 82: ニューヤマザキデイリーストア
  // 85: ニューデイズ
  // 90: ポプラ
  // 91: くらしハウス
  // 92: スリーエイト
  // 93: 生活彩家
  int? cvsCode;
  String? storeGenreCode;
  String? storeCode;
  String? storeName;
  String? storeZip;
  String? storePrefecture;
  String? storeAddress;
  String? areaCode;
  String? depo;

  // HH:mm
  String? openTime;

  // HH:mm
  String? closeTime;
  String? cvsRemarks;
  DeliveryCVSModel.fromJson(Map<String, dynamic> json)
      : cvsCode = json["cvsCode"],
        storeGenreCode = json["storeGenreCode"],
        storeCode = json["storeCode"],
        storeName = json["storeName"],
        storeZip = json["storeZip"],
        storePrefecture = json["storePrefecture"],
        storeAddress = json["storeAddress"],
        areaCode = json["areaCode"],
        depo = json["depo"],
        openTime = json["openTime"],
        closeTime = json["closeTime"],
        cvsRemarks = json["cvsRemarks"];
  Map<String, dynamic> toMap() {
    return {
      "cvsCode": cvsCode,
      "storeGenreCode": storeGenreCode,
      "storeCode": storeCode,
      "storeName": storeName,
      "storeZip": storeZip,
      "storePrefecture": storePrefecture,
      "storeAddress": storeAddress,
      "areaCode": areaCode,
      "depo": depo,
      "openTime": openTime,
      "closeTime": closeTime,
      "cvsRemarks": cvsRemarks,
    };
  }
}
