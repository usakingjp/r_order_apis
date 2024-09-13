class SenderModel {
  SenderModel({
    required this.zipCode1,
    required this.zipCode2,
    required this.prefecture,
    required this.city,
    required this.subAddress,
    required this.familyName,
    this.firstName,
    this.familyNameKana,
    this.firstNameKana,
    required this.phoneNumber1,
    required this.phoneNumber2,
    required this.phoneNumber3,
    required this.isolatedIslandFlag,
  });

  /// 郵便番号1
  String zipCode1;

  /// 郵便番号2
  String zipCode2;

  /// 都道府県
  String prefecture;

  /// 郡市区
  String city;

  /// それ以降の住所
  String subAddress;

  /// 姓
  String familyName;

  /// 名
  String? firstName;

  /// 姓カナ
  String? familyNameKana;

  /// 名カナ
  String? firstNameKana;

  /// 電話番号1
  String phoneNumber1;

  /// 電話番号2
  String phoneNumber2;

  /// 電話番号3
  String phoneNumber3;

  /// 離島フラグ
  int isolatedIslandFlag;

  SenderModel.fromJson(Map<String, dynamic> json)
      : zipCode1 = json["zipCode1"],
        zipCode2 = json["zipCode2"],
        prefecture = json["prefecture"],
        city = json["city"],
        subAddress = json["subAddress"],
        familyName = json["familyName"],
        firstName = json["firstName"],
        familyNameKana = json["familyNameKana"],
        firstNameKana = json["firstNameKana"],
        phoneNumber1 = json["phoneNumber1"],
        phoneNumber2 = json["phoneNumber2"],
        phoneNumber3 = json["phoneNumber3"],
        isolatedIslandFlag = json["isolatedIslandFlag"];
  Map<String, dynamic> toMap() {
    return {
      "zipCode1": zipCode1,
      "zipCode2": zipCode2,
      "prefecture": prefecture,
      "city": city,
      "subAddress": subAddress,
      "familyName": familyName,
      "firstName": firstName,
      "familyNameKana": familyNameKana,
      "firstNameKana": firstNameKana,
      "phoneNumber1": phoneNumber1,
      "phoneNumber2": phoneNumber2,
      "phoneNumber3": phoneNumber3,
      "isolatedIslandFlag": isolatedIslandFlag,
    };
  }
}
