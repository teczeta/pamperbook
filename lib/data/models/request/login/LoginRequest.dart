import 'dart:convert';
/// action : "login"
/// data : {"username":"admin@pb.com","password":"password","deviceId":"xxxxxxxx","deviceDetails":"xxxxxxxx"}

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));
String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());
class LoginRequest {
  LoginRequest({
      String? action,
    LoginRequestData? data,}){
    _action = action;
    _data = data;
}

  LoginRequest.fromJson(dynamic json) {
    _action = json['action'];
    _data = json['data'] != null ? LoginRequestData.fromJson(json['data']) : null;
  }
  String? _action;
  LoginRequestData? _data;
LoginRequest copyWith({  String? action,
  LoginRequestData? data,
}) => LoginRequest(  action: action ?? _action,
  data: data ?? _data,
);
  String? get action => _action;

  set action(String? value) {
    _action = value;
  }

  LoginRequestData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['action'] = _action;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

  set data(LoginRequestData? value) {
    _data = value;
  }
}

/// username : "admin@pb.com"
/// password : "password"
/// deviceId : "xxxxxxxx"
/// deviceDetails : "xxxxxxxx"

LoginRequestData dataFromJson(String str) => LoginRequestData.fromJson(json.decode(str));
String dataToJson(LoginRequestData data) => json.encode(data.toJson());
class LoginRequestData {
  LoginRequestData({
      String? username, 
      String? password, 
      String? deviceId, 
      String? deviceDetails,}){
    _username = username;
    _password = password;
    _deviceId = deviceId;
    _deviceDetails = deviceDetails;
}

  LoginRequestData.fromJson(dynamic json) {
    _username = json['username'];
    _password = json['password'];
    _deviceId = json['deviceId'];
    _deviceDetails = json['deviceDetails'];
  }
  String? _username;
  String? _password;
  String? _deviceId;

  set username(String? value) {
    _username = value;
  }

  String? _deviceDetails;
  LoginRequestData copyWith({  String? username,
  String? password,
  String? deviceId,
  String? deviceDetails,
}) => LoginRequestData(  username: username ?? _username,
  password: password ?? _password,
  deviceId: deviceId ?? _deviceId,
  deviceDetails: deviceDetails ?? _deviceDetails,
);
  String? get username => _username;
  String? get password => _password;
  String? get deviceId => _deviceId;
  String? get deviceDetails => _deviceDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['password'] = _password;
    map['deviceId'] = _deviceId;
    map['deviceDetails'] = _deviceDetails;
    return map;
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