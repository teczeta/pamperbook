import 'dart:convert';
/// action : "getDetailsForNewAppointment"
/// data : {"new":"Value"}

GetAppointmentDetailsRequest getAppointmentDetailsRequestFromJson(String str) => GetAppointmentDetailsRequest.fromJson(json.decode(str));
String getAppointmentDetailsRequestToJson(GetAppointmentDetailsRequest data) => json.encode(data.toJson());
class GetAppointmentDetailsRequest {
  GetAppointmentDetailsRequest({
      String? action, 
      Data? data,}){
    _action = action;
    _data = data;
}

  GetAppointmentDetailsRequest.fromJson(dynamic json) {
    _action = json['action'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _action;
  Data? _data;
GetAppointmentDetailsRequest copyWith({  String? action,
  Data? data,
}) => GetAppointmentDetailsRequest(  action: action ?? _action,
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

/// new : "Value"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? newValue,}){
    _newValue = newValue;
}

  Data.fromJson(dynamic json) {
    _newValue = json['_newValue'];
  }
  String? _newValue;
Data copyWith({  String? newValue,
}) => Data(  newValue: newValue ?? _newValue,
);
  String? get newValue => _newValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['newValue'] = _newValue;
    return map;
  }

}