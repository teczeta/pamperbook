import 'dart:convert';
/// action : "getAppointmentDetails"
/// data : {"appointmentId":528627}

EditAppointmentDetailsRequest editAppointmentDetailsRequestFromJson(String str) => EditAppointmentDetailsRequest.fromJson(json.decode(str));
String editAppointmentDetailsRequestToJson(EditAppointmentDetailsRequest data) => json.encode(data.toJson());
class EditAppointmentDetailsRequest {
  EditAppointmentDetailsRequest({
      String? action, 
      DataEdit? data,}){
    _action = action;
    _data = data;
}

  EditAppointmentDetailsRequest.fromJson(dynamic json) {
    _action = json['action'];
    _data = json['data'] != null ? DataEdit.fromJson(json['data']) : null;
  }
  String? _action;
  DataEdit? _data;
EditAppointmentDetailsRequest copyWith({  String? action,
  DataEdit? data,
}) => EditAppointmentDetailsRequest(  action: action ?? _action,
  data: data ?? _data,
);
  String? get action => _action;
  DataEdit? get data => _data;

  set action(String? value) {
    _action = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['action'] = _action;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

  set data(DataEdit? value) {
    _data = value;
  }
}

/// appointmentId : 528627

DataEdit dataFromJson(String str) => DataEdit.fromJson(json.decode(str));
String dataToJson(DataEdit data) => json.encode(data.toJson());
class DataEdit {
  DataEdit({
      int? appointmentId,}){
    _appointmentId = appointmentId;
}

  set appointmentId(int? value) {
    _appointmentId = value;
  }

  DataEdit.fromJson(dynamic json) {
    _appointmentId = json['appointmentId'];
  }
  int? _appointmentId;
  DataEdit copyWith({  int? appointmentId,
}) => DataEdit(  appointmentId: appointmentId ?? _appointmentId,
);
  int? get appointmentId => _appointmentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appointmentId'] = _appointmentId;
    return map;
  }

}