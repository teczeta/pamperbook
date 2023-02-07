import 'dart:convert';

import '../../InitRequest.dart';

UpdateBusinessDetailsResponse updateBusinessDetailsResponseFromJson(String str) => UpdateBusinessDetailsResponse.fromJson(json.decode(str));
String updateBusinessDetailsResponseToJson(UpdateBusinessDetailsResponse data) => json.encode(data.toJson());
class UpdateBusinessDetailsResponse {
  UpdateBusinessDetailsResponse({
      bool? error, 
      int? code, 
      String? message, 
      Data? data,}){
    _error = error;
    _code = code;
    _message = message;
    _data = data;
}

  UpdateBusinessDetailsResponse.fromJson(dynamic json) {
    _error = json['error'];
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  int? _code;
  String? _message;
  Data? _data;
UpdateBusinessDetailsResponse copyWith({  bool? error,
  int? code,
  String? message,
  Data? data,
}) => UpdateBusinessDetailsResponse(  error: error ?? _error,
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