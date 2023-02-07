import 'Data.dart';
import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) => RegisterRequest.fromJson(json.decode(str));
String registerRequestToJson(RegisterRequest data) => json.encode(data.toJson());
class RegisterRequest {
  RegisterRequest({
      String? action, 
      Data? data,}){
    _action = action;
    _data = data;
}

  RegisterRequest.fromJson(dynamic json) {
    _action = json['action'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _action;
  Data? _data;
RegisterRequest copyWith({  String? action,
  Data? data,
}) => RegisterRequest(  action: action ?? _action,
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