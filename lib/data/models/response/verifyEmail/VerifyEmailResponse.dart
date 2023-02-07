import 'Data.dart';
import 'dart:convert';

VerifyEmailResponse verifyEmailResponseFromJson(String str) => VerifyEmailResponse.fromJson(json.decode(str));
String verifyEmailResponseToJson(VerifyEmailResponse data) => json.encode(data.toJson());
class VerifyEmailResponse {
  VerifyEmailResponse({
      bool? error, 
      int? code, 
      String? message, 
      Data? data,}){
    _error = error;
    _code = code;
    _message = message;
    _data = data;
}

  VerifyEmailResponse.fromJson(dynamic json) {
    _error = json['error'];
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  int? _code;
  String? _message;
  Data? _data;
VerifyEmailResponse copyWith({  bool? error,
  int? code,
  String? message,
  Data? data,
}) => VerifyEmailResponse(  error: error ?? _error,
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