import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? businessName, 
      String? businessType, 
      String? phone, 
      String? email, 
      String? houseNo, 
      String? street, 
      String? townCity, 
      String? postCode, 
      bool? isAddressPublic,}){
    _businessName = businessName;
    _businessType = businessType;
    _phone = phone;
    _email = email;
    _houseNo = houseNo;
    _street = street;
    _townCity = townCity;
    _postCode = postCode;
    _isAddressPublic = isAddressPublic;
}

  set businessName(String? value) {
    _businessName = value;
  }

  Data.fromJson(dynamic json) {
    _businessName = json['businessName'];
    _businessType = json['businessType'];
    _phone = json['phone'];
    _email = json['email'];
    _houseNo = json['houseNo'];
    _street = json['street'];
    _townCity = json['townCity'];
    _postCode = json['postCode'];
    _isAddressPublic = json['isAddressPublic'];
  }
  String? _businessName;
  String? _businessType;
  String? _phone;
  String? _email;
  String? _houseNo;
  String? _street;
  String? _townCity;
  String? _postCode;
  bool? _isAddressPublic;
Data copyWith({  String? businessName,
  String? businessType,
  String? phone,
  String? email,
  String? houseNo,
  String? street,
  String? townCity,
  String? postCode,
  bool? isAddressPublic,
}) => Data(  businessName: businessName ?? _businessName,
  businessType: businessType ?? _businessType,
  phone: phone ?? _phone,
  email: email ?? _email,
  houseNo: houseNo ?? _houseNo,
  street: street ?? _street,
  townCity: townCity ?? _townCity,
  postCode: postCode ?? _postCode,
  isAddressPublic: isAddressPublic ?? _isAddressPublic,
);
  String? get businessName => _businessName;
  String? get businessType => _businessType;
  String? get phone => _phone;
  String? get email => _email;
  String? get houseNo => _houseNo;
  String? get street => _street;
  String? get townCity => _townCity;
  String? get postCode => _postCode;
  bool? get isAddressPublic => _isAddressPublic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['businessName'] = _businessName;
    map['businessType'] = _businessType;
    map['phone'] = _phone;
    map['email'] = _email;
    map['houseNo'] = _houseNo;
    map['street'] = _street;
    map['townCity'] = _townCity;
    map['postCode'] = _postCode;
    map['isAddressPublic'] = _isAddressPublic;
    return map;
  }

  set businessType(String? value) {
    _businessType = value;
  }

  set phone(String? value) {
    _phone = value;
  }

  set email(String? value) {
    _email = value;
  }

  set houseNo(String? value) {
    _houseNo = value;
  }

  set street(String? value) {
    _street = value;
  }

  set townCity(String? value) {
    _townCity = value;
  }

  set postCode(String? value) {
    _postCode = value;
  }

  set isAddressPublic(bool? value) {
    _isAddressPublic = value;
  }
}