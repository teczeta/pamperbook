import 'dart:convert';
/// action : "editAppointment"
/// data : {"appointmentId":528631,"date":"2023-12-22","time":"15:45","houseNo":"123","street":"123","townCity":"123","postCode":"123","price":2000,"duration":30}

UpdateAppointmentRequest updateAppointmentRequestFromJson(String str) => UpdateAppointmentRequest.fromJson(json.decode(str));
String updateAppointmentRequestToJson(UpdateAppointmentRequest data) => json.encode(data.toJson());
class UpdateAppointmentRequest {
  UpdateAppointmentRequest({
      String? action,
    DataUpdate? data,}){
    _action = action;
    _data = data;
}

  UpdateAppointmentRequest.fromJson(dynamic json) {
    _action = json['action'];
    _data = json['data'] != null ? DataUpdate.fromJson(json['data']) : null;
  }
  String? _action;
  DataUpdate? _data;
UpdateAppointmentRequest copyWith({  String? action,
  DataUpdate? data,
}) => UpdateAppointmentRequest(  action: action ?? _action,
  data: data ?? _data,
);
  String? get action => _action;

  set action(String? value) {
    _action = value;
  }

  DataUpdate? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['action'] = _action;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

  set data(DataUpdate? value) {
    _data = value;
  }
}

/// appointmentId : 528631
/// date : "2023-12-22"
/// time : "15:45"
/// houseNo : "123"
/// street : "123"
/// townCity : "123"
/// postCode : "123"
/// price : 2000
/// duration : 30

DataUpdate dataFromJson(String str) => DataUpdate.fromJson(json.decode(str));
String dataToJson(DataUpdate data) => json.encode(data.toJson());
class DataUpdate {
  DataUpdate({
      int? appointmentId, 
      String? date, 
      String? time, 
      String? houseNo, 
      String? street, 
      String? townCity, 
      String? postCode, 
      int? price, 
      int? duration,}){
    _appointmentId = appointmentId;
    _date = date;
    _time = time;
    _houseNo = houseNo;
    _street = street;
    _townCity = townCity;
    _postCode = postCode;
    _price = price;
    _duration = duration;
}

  set appointmentId(int? value) {
    _appointmentId = value;
  }

  DataUpdate.fromJson(dynamic json) {
    _appointmentId = json['appointmentId'];
    _date = json['date'];
    _time = json['time'];
    _houseNo = json['houseNo'];
    _street = json['street'];
    _townCity = json['townCity'];
    _postCode = json['postCode'];
    _price = json['price'];
    _duration = json['duration'];
  }
  int? _appointmentId;
  String? _date;
  String? _time;
  String? _houseNo;
  String? _street;
  String? _townCity;
  String? _postCode;
  int? _price;
  int? _duration;
  DataUpdate copyWith({  int? appointmentId,
  String? date,
  String? time,
  String? houseNo,
  String? street,
  String? townCity,
  String? postCode,
  int? price,
  int? duration,
}) => DataUpdate(  appointmentId: appointmentId ?? _appointmentId,
  date: date ?? _date,
  time: time ?? _time,
  houseNo: houseNo ?? _houseNo,
  street: street ?? _street,
  townCity: townCity ?? _townCity,
  postCode: postCode ?? _postCode,
  price: price ?? _price,
  duration: duration ?? _duration,
);
  int? get appointmentId => _appointmentId;
  String? get date => _date;
  String? get time => _time;
  String? get houseNo => _houseNo;
  String? get street => _street;
  String? get townCity => _townCity;
  String? get postCode => _postCode;
  int? get price => _price;
  int? get duration => _duration;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appointmentId'] = _appointmentId;
    map['date'] = _date;
    map['time'] = _time;
    map['houseNo'] = _houseNo;
    map['street'] = _street;
    map['townCity'] = _townCity;
    map['postCode'] = _postCode;
    map['price'] = _price;
    map['duration'] = _duration;
    return map;
  }

  set date(String? value) {
    _date = value;
  }

  set time(String? value) {
    _time = value;
  }

  set houseNo(String? value) {
    _houseNo = value;
  }

  set street(String? value) {
    _street = value;
  }

  set townCity(String? value) {
    _townCity = value;
  }

  set postCode(String? value) {
    _postCode = value;
  }

  set price(int? value) {
    _price = value;
  }

  set duration(int? value) {
    _duration = value;
  }
}