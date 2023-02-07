import 'dart:convert';
/// error : false
/// code : 2000
/// message : "...success message"
/// data : {"messageNew":"...success message"}

UpdateAppointmentResponse updateAppointmentResponseFromJson(String str) => UpdateAppointmentResponse.fromJson(json.decode(str));
String updateAppointmentResponseToJson(UpdateAppointmentResponse data) => json.encode(data.toJson());
class UpdateAppointmentResponse {
  UpdateAppointmentResponse({
      bool? error, 
      int? code, 
      String? message, 
      Data? data,}){
    _error = error;
    _code = code;
    _message = message;
    _data = data;
}

  UpdateAppointmentResponse.fromJson(dynamic json) {
    _error = json['error'];
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  int? _code;
  String? _message;
  Data? _data;
UpdateAppointmentResponse copyWith({  bool? error,
  int? code,
  String? message,
  Data? data,
}) => UpdateAppointmentResponse(  error: error ?? _error,
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

/// messageNew : "...success message"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? messageNew,}){
    _messageNew = messageNew;
}

  Data.fromJson(dynamic json) {
    _messageNew = json['messageNew'];
  }
  String? _messageNew;
Data copyWith({  String? messageNew,
}) => Data(  messageNew: messageNew ?? _messageNew,
);
  String? get messageNew => _messageNew;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['messageNew'] = _messageNew;
    return map;
  }

}