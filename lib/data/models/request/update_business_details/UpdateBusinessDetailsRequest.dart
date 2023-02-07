import 'Data.dart';
import 'dart:convert';

UpdateBusinessDetailsRequest updateBusinessDetailsRequestFromJson(String str) => UpdateBusinessDetailsRequest.fromJson(json.decode(str));
String updateBusinessDetailsRequestToJson(UpdateBusinessDetailsRequest data) => json.encode(data.toJson());
class UpdateBusinessDetailsRequest {
  UpdateBusinessDetailsRequest({
      String? action, 
      Data? data,}){
    _action = action;
    _data = data;
}

  set action(String? value) {
    _action = value;
  }

  UpdateBusinessDetailsRequest.fromJson(dynamic json) {
    _action = json['action'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _action;
  Data? _data;
UpdateBusinessDetailsRequest copyWith({  String? action,
  Data? data,
}) => UpdateBusinessDetailsRequest(  action: action ?? _action,
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