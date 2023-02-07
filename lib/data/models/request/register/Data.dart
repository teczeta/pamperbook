import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? email, 
      String? firstName, 
      String? lastName, 
      String? businessName, 
      String? phone, 
      String? instagram, 
      String? country, 
      String? password, 
      String? deviceId, 
      String? deviceDetails,}){
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _businessName = businessName;
    _phone = phone;
    _instagram = instagram;
    _country = country;
    _password = password;
    _deviceId = deviceId;
    _deviceDetails = deviceDetails;
}

  set email(String? value) {
    _email = value;
  }

  Data.fromJson(dynamic json) {
    _email = json['email'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _businessName = json['businessName'];
    _phone = json['phone'];
    _instagram = json['instagram'];
    _country = json['country'];
    _password = json['password'];
    _deviceId = json['deviceId'];
    _deviceDetails = json['deviceDetails'];
  }
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _businessName;
  String? _phone;
  String? _instagram;
  String? _country;
  String? _password;
  String? _deviceId;
  String? _deviceDetails;
Data copyWith({  String? email,
  String? firstName,
  String? lastName,
  String? businessName,
  String? phone,
  String? instagram,
  String? country,
  String? password,
  String? deviceId,
  String? deviceDetails,
}) => Data(  email: email ?? _email,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  businessName: businessName ?? _businessName,
  phone: phone ?? _phone,
  instagram: instagram ?? _instagram,
  country: country ?? _country,
  password: password ?? _password,
  deviceId: deviceId ?? _deviceId,
  deviceDetails: deviceDetails ?? _deviceDetails,
);
  String? get email => _email;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get businessName => _businessName;
  String? get phone => _phone;
  String? get instagram => _instagram;
  String? get country => _country;
  String? get password => _password;
  String? get deviceId => _deviceId;
  String? get deviceDetails => _deviceDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['businessName'] = _businessName;
    map['phone'] = _phone;
    map['instagram'] = _instagram;
    map['country'] = _country;
    map['password'] = _password;
    map['deviceId'] = _deviceId;
    map['deviceDetails'] = _deviceDetails;
    return map;
  }

  set firstName(String? value) {
    _firstName = value;
  }

  set lastName(String? value) {
    _lastName = value;
  }

  set businessName(String? value) {
    _businessName = value;
  }

  set phone(String? value) {
    _phone = value;
  }

  set instagram(String? value) {
    _instagram = value;
  }

  set country(String? value) {
    _country = value;
  }

  set password(String? value) {
    _password = value;
  }

  set deviceId(String? value) {
    _deviceId = value;
  }

  set deviceDetails(String? value) {
    _deviceDetails = value;
  }
}