import 'dart:convert';
/// action : "init"
/// data : {"appVersion":"1.0.0","deviceId":"xxxxxxxx","deviceDetails":"xxxxxxxx"}

InitRequest initRequestFromJson(String str) => InitRequest.fromJson(json.decode(str));
String initRequestToJson(InitRequest data) => json.encode(data.toJson());
class InitRequest {
  InitRequest({
      String? action, 
      Data? data,}){
    _action = action;
    _data = data;
}

  InitRequest.fromJson(dynamic json) {
    _action = json['action'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _action;
  Data? _data;
InitRequest copyWith({  String? action,
  Data? data,
}) => InitRequest(  action: action ?? _action,
  data: data ?? _data,
);
  String? get action => _action;

  set action(String? value) {
    _action = value;
  }

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['action'] = _action;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

  set data(Data? value) {
    _data = value;
  }
}

/// appVersion : "1.0.0"
/// deviceId : "xxxxxxxx"
/// deviceDetails : "xxxxxxxx"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? appVersion, 
      String? deviceId, 
      String? deviceDetails,}){
    _appVersion = appVersion;
    _deviceId = deviceId;
    _deviceDetails = deviceDetails;
}

  Data.fromJson(dynamic json) {
    _appVersion = json['appVersion'];
    _deviceId = json['deviceId'];
    _deviceDetails = json['deviceDetails'];
  }
  String? _appVersion;
  String? _deviceId;
  String? _deviceDetails;
Data copyWith({  String? appVersion,
  String? deviceId,
  String? deviceDetails,
}) => Data(  appVersion: appVersion ?? _appVersion,
  deviceId: deviceId ?? _deviceId,
  deviceDetails: deviceDetails ?? _deviceDetails,
);
  String? get appVersion => _appVersion;
  String? get deviceId => _deviceId;

  set appVersion(String? value) {
    _appVersion = value;
  }

  String? get deviceDetails => _deviceDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appVersion'] = _appVersion;
    map['deviceId'] = _deviceId;
    map['deviceDetails'] = _deviceDetails;
    return map;
  }

  set deviceId(String? value) {
    _deviceId = value;
  }

  set deviceDetails(String ?value) {
    _deviceDetails = value;
  }
}