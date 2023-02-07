import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? email, 
      String? verificationCode, 
      String? deviceId, 
      String? deviceDetails,}){
    _email = email;
    _verificationCode = verificationCode;
    _deviceId = deviceId;
    _deviceDetails = deviceDetails;
}

  set email(String? value) {
    _email = value;
  }

  Data.fromJson(dynamic json) {
    _email = json['email'];
    _verificationCode = json['verificationCode'];
    _deviceId = json['deviceId'];
    _deviceDetails = json['deviceDetails'];
  }
  String? _email;
  String? _verificationCode;
  String? _deviceId;
  String? _deviceDetails;
Data copyWith({  String? email,
  String? verificationCode,
  String? deviceId,
  String? deviceDetails,
}) => Data(  email: email ?? _email,
  verificationCode: verificationCode ?? _verificationCode,
  deviceId: deviceId ?? _deviceId,
  deviceDetails: deviceDetails ?? _deviceDetails,
);
  String? get email => _email;
  String? get verificationCode => _verificationCode;
  String? get deviceId => _deviceId;
  String? get deviceDetails => _deviceDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['verificationCode'] = _verificationCode;
    map['deviceId'] = _deviceId;
    map['deviceDetails'] = _deviceDetails;
    return map;
  }

  set verificationCode(String? value) {
    _verificationCode = value;
  }

  set deviceId(String? value) {
    _deviceId = value;
  }

  set deviceDetails(String? value) {
    _deviceDetails = value;
  }
}