import 'dart:convert';
/// error : false
/// code : 2000
/// message : "Success"
/// data : {"apiVersion":"1.0.0","minimumAppVersion":"1.0.0","latestAppVersion":"1.0.0","isUpdateAvailable":false,"forceUpdate":false,"updateMessage":"","killSwitch":false,"killSwitchMessage":""}

InitResponse initResponseFromJson(String str) => InitResponse.fromJson(json.decode(str));
String initResponseToJson(InitResponse data) => json.encode(data.toJson());
class InitResponse {
  InitResponse({
      bool? error, 
      int? code, 
      String? message, 
      Data? data,}){
    _error = error;
    _code = code;
    _message = message;
    _data = data;
}

  InitResponse.fromJson(dynamic json) {
    _error = json['error'];
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  int? _code;
  String? _message;
  Data? _data;
InitResponse copyWith({  bool? error,
  int? code,
  String? message,
  Data? data,
}) => InitResponse(  error: error ?? _error,
  code: code ?? _code,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  int? get code => _code;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['code'] = _code;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// apiVersion : "1.0.0"
/// minimumAppVersion : "1.0.0"
/// latestAppVersion : "1.0.0"
/// isUpdateAvailable : false
/// forceUpdate : false
/// updateMessage : ""
/// killSwitch : false
/// killSwitchMessage : ""

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? apiVersion, 
      String? minimumAppVersion, 
      String? latestAppVersion, 
      bool? isUpdateAvailable, 
      bool? forceUpdate, 
      String? updateMessage, 
      bool? killSwitch, 
      String? killSwitchMessage,}){
    _apiVersion = apiVersion;
    _minimumAppVersion = minimumAppVersion;
    _latestAppVersion = latestAppVersion;
    _isUpdateAvailable = isUpdateAvailable;
    _forceUpdate = forceUpdate;
    _updateMessage = updateMessage;
    _killSwitch = killSwitch;
    _killSwitchMessage = killSwitchMessage;
}

  Data.fromJson(dynamic json) {
    _apiVersion = json['apiVersion'];
    _minimumAppVersion = json['minimumAppVersion'];
    _latestAppVersion = json['latestAppVersion'];
    _isUpdateAvailable = json['isUpdateAvailable'];
    _forceUpdate = json['forceUpdate'];
    _updateMessage = json['updateMessage'];
    _killSwitch = json['killSwitch'];
    _killSwitchMessage = json['killSwitchMessage'];
  }
  String? _apiVersion;
  String? _minimumAppVersion;
  String? _latestAppVersion;
  bool? _isUpdateAvailable;
  bool? _forceUpdate;
  String? _updateMessage;
  bool? _killSwitch;
  String? _killSwitchMessage;
Data copyWith({  String? apiVersion,
  String? minimumAppVersion,
  String? latestAppVersion,
  bool? isUpdateAvailable,
  bool? forceUpdate,
  String? updateMessage,
  bool? killSwitch,
  String? killSwitchMessage,
}) => Data(  apiVersion: apiVersion ?? _apiVersion,
  minimumAppVersion: minimumAppVersion ?? _minimumAppVersion,
  latestAppVersion: latestAppVersion ?? _latestAppVersion,
  isUpdateAvailable: isUpdateAvailable ?? _isUpdateAvailable,
  forceUpdate: forceUpdate ?? _forceUpdate,
  updateMessage: updateMessage ?? _updateMessage,
  killSwitch: killSwitch ?? _killSwitch,
  killSwitchMessage: killSwitchMessage ?? _killSwitchMessage,
);
  String? get apiVersion => _apiVersion;
  String? get minimumAppVersion => _minimumAppVersion;
  String? get latestAppVersion => _latestAppVersion;
  bool? get isUpdateAvailable => _isUpdateAvailable;
  bool? get forceUpdate => _forceUpdate;
  String? get updateMessage => _updateMessage;
  bool? get killSwitch => _killSwitch;
  String? get killSwitchMessage => _killSwitchMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apiVersion'] = _apiVersion;
    map['minimumAppVersion'] = _minimumAppVersion;
    map['latestAppVersion'] = _latestAppVersion;
    map['isUpdateAvailable'] = _isUpdateAvailable;
    map['forceUpdate'] = _forceUpdate;
    map['updateMessage'] = _updateMessage;
    map['killSwitch'] = _killSwitch;
    map['killSwitchMessage'] = _killSwitchMessage;
    return map;
  }

}