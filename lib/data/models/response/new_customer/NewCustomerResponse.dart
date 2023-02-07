import 'dart:convert';
/// error : false
/// code : 2000
/// message : "Success"
/// data : {"scalar":"...success message"}

NewCustomerResponse newCustomerResponseFromJson(String str) => NewCustomerResponse.fromJson(json.decode(str));
String newCustomerResponseToJson(NewCustomerResponse data) => json.encode(data.toJson());
class NewCustomerResponse {
  NewCustomerResponse({
      bool? error, 
      int? code, 
      String? message, 
      Data? data,}){
    _error = error;
    _code = code;
    _message = message;
    _data = data;
}

  NewCustomerResponse.fromJson(dynamic json) {
    _error = json['error'];
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  int? _code;
  String? _message;
  Data? _data;
NewCustomerResponse copyWith({  bool? error,
  int? code,
  String? message,
  Data? data,
}) => NewCustomerResponse(  error: error ?? _error,
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

/// scalar : "...success message"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? scalar,}){
    _scalar = scalar;
}

  Data.fromJson(dynamic json) {
    _scalar = json['scalar'];
  }
  String? _scalar;
Data copyWith({  String? scalar,
}) => Data(  scalar: scalar ?? _scalar,
);
  String? get scalar => _scalar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['scalar'] = _scalar;
    return map;
  }

}