class SenderModel {
  SenderModel({
    required this.zipCode1, //郵便番号1
    required this.zipCode2, //郵便番号2
    required this.prefecture, //都道府県
    required this.city, //郡市区
    required this.subAddress, //それ以降の住所
    required this.familyName, //姓
    this.firstName, //名
    this.familyNameKana, //姓カナ
    this.firstNameKana, //名カナ
    required this.phoneNumber1, //電話番号1
    required this.phoneNumber2, //電話番号2
    required this.phoneNumber3, //電話番号3
    required this.isolatedIslandFlag, //離島フラグ
  });
  String zipCode1;
  String zipCode2;
  String prefecture;
  String city;
  String subAddress;
  String familyName;
  String? firstName;
  String? familyNameKana;
  String? firstNameKana;
  String phoneNumber1;
  String phoneNumber2;
  String phoneNumber3;
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
