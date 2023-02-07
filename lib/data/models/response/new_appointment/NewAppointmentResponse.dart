import 'dart:convert';
/// error : false
/// code : 2000
/// message : "...success message"
/// data : {"messagenew":"...success message"}

NewAppointmentResponse newAppointmentResponseFromJson(String str) => NewAppointmentResponse.fromJson(json.decode(str));
String newAppointmentResponseToJson(NewAppointmentResponse data) => json.encode(data.toJson());
class NewAppointmentResponse {
  NewAppointmentResponse({
      bool? error, 
      int? code, 
      String? message, 
      Data? data,}){
    _error = error;
    _code = code;
    _message = message;
    _data = data;
}

  NewAppointmentResponse.fromJson(dynamic json) {
    _error = json['error'];
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  int? _code;
  String? _message;
  Data? _data;
NewAppointmentResponse copyWith({  bool? error,
  int? code,
  String? message,
  Data? data,
}) => NewAppointmentResponse(  error: error ?? _error,
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

/// messagenew : "...success message"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? messagenew,}){
    _messagenew = messagenew;
}

  Data.fromJson(dynamic json) {
    _messagenew = json['messagenew'];
  }
  String? _messagenew;
Data copyWith({  String? messagenew,
}) => Data(  messagenew: messagenew ?? _messagenew,
);
  String? get messagenew => _messagenew;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['messagenew'] = _messagenew;
    return map;
  }

}