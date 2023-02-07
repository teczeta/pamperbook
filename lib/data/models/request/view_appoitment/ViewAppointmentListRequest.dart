import 'dart:convert';
/// action : "appointmentList"
/// data : {"keyy":"value"}

ViewAppointmentListRequest viewAppointmentListRequestFromJson(String str) => ViewAppointmentListRequest.fromJson(json.decode(str));
String viewAppointmentListRequestToJson(ViewAppointmentListRequest data) => json.encode(data.toJson());
class ViewAppointmentListRequest {
  ViewAppointmentListRequest({
      String? action, 
      Data? data,}){
    _action = action;
    _data = data;
}

  ViewAppointmentListRequest.fromJson(dynamic json) {
    _action = json['action'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _action;
  Data? _data;
ViewAppointmentListRequest copyWith({  String? action,
  Data? data,
}) => ViewAppointmentListRequest(  action: action ?? _action,
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

/// keyy : "value"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? keyy,}){
    _keyy = keyy;
}

  Data.fromJson(dynamic json) {
    _keyy = json['keyy'];
  }
  String? _keyy;
Data copyWith({  String? keyy,
}) => Data(  keyy: keyy ?? _keyy,
);
  String? get keyy => _keyy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['keyy'] = _keyy;
    return map;
  }

}