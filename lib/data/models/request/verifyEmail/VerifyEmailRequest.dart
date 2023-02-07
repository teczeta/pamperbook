import 'Data.dart';
import 'dart:convert';

VerifyEmailRequest verifyEmailRequestFromJson(String str) => VerifyEmailRequest.fromJson(json.decode(str));
String verifyEmailRequestToJson(VerifyEmailRequest data) => json.encode(data.toJson());
class VerifyEmailRequest {
  VerifyEmailRequest({
      String? action, 
      Data? data,}){
    _action = action;
    _data = data;
}

  set action(String? value) {
    _action = value;
  }

  VerifyEmailRequest.fromJson(dynamic json) {
    _action = json['action'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _action;
  Data? _data;
VerifyEmailRequest copyWith({  String? action,
  Data? data,
}) => VerifyEmailRequest(  action: action ?? _action,
  data: data ?? _data,
);
  String? get action => _action;
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