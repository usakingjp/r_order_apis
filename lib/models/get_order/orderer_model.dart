class OrdererModel {
  OrdererModel({
    required this.zipCode1, //郵便番号1
    required this.zipCode2, //郵便番号2
    required this.prefecture, //都道府県
    required this.city, //郡市区
    required this.subAddress, //それ以降の住所
    required this.familyName, //姓
    required this.firstName, //名
    this.familyNameKana, //姓カナ
    this.firstNameKana, //名カナ
    required this.phoneNumber1, //電話番号1
    required this.phoneNumber2, //電話番号2
    required this.phoneNumber3, //電話番号3
    required this.emailAddress, //メールアドレス
    this.sex, //性別
    this.birthYear, //誕生日(年)
    this.birthMonth, //誕生日(月)
    this.birthDay, //誕生日(日)
  });
  final String zipCode1;
  final String zipCode2;
  final String prefecture;
  final String city;
  final String subAddress;
  final String familyName;
  final String firstName;
  final String? familyNameKana;
  final String? firstNameKana;
  final String phoneNumber1;
  final String phoneNumber2;
  final String phoneNumber3;
  final String emailAddress;
  final String? sex;
  final int? birthYear;
  final int? birthMonth;
  final int? birthDay;

  OrdererModel.fromJson(Map<String, dynamic> json)
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
        emailAddress = json["emailAddress"],
        sex = json["sex"],
        birthYear = json["birthYear"],
        birthMonth = json["birthMonth"],
        birthDay = json["birthDay"];

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
      "emailAddress": emailAddress,
      "sex": sex,
      "birthYear": birthYear,
      "birthMonth": birthMonth,
      "birthDay": birthDay,
    };
  }
}
