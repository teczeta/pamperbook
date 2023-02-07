import 'dart:convert';
/// action : "addAppointment"
/// data : {"customerId":1,"date":"2023-12-22","time":"15:45","staffId":1,"houseNo":"123","street":"123","townCity":"123","postCode":"123","serviceId":1,"price":2000,"duration":30,"notes":"note"}

NewAppointmentRequest newAppointmentRequestFromJson(String str) => NewAppointmentRequest.fromJson(json.decode(str));
String newAppointmentRequestToJson(NewAppointmentRequest data) => json.encode(data.toJson());
class NewAppointmentRequest {
  NewAppointmentRequest({
      String? action,
    DataNewAppointment? data,}){
    _action = action;
    _data = data;
}

  set action(String? value) {
    _action = value;
  }

  NewAppointmentRequest.fromJson(dynamic json) {
    _action = json['action'];
    _data = json['data'] != null ? DataNewAppointment.fromJson(json['data']) : null;
  }
  String? _action;
  DataNewAppointment? _data;
NewAppointmentRequest copyWith({  String? action,
  DataNewAppointment? data,
}) => NewAppointmentRequest(  action: action ?? _action,
  data: data ?? _data,
);
  String? get action => _action;
  DataNewAppointment? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['action'] = _action;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

  set data(DataNewAppointment? value) {
    _data = value;
  }
}

/// customerId : 1
/// date : "2023-12-22"
/// time : "15:45"
/// staffId : 1
/// houseNo : "123"
/// street : "123"
/// townCity : "123"
/// postCode : "123"
/// serviceId : 1
/// price : 2000
/// duration : 30
/// notes : "note"

DataNewAppointment dataFromJson(String str) => DataNewAppointment.fromJson(json.decode(str));
String dataToJson(DataNewAppointment data) => json.encode(data.toJson());
class DataNewAppointment {
  DataNewAppointment({
      int? customerId, 
      String? date, 
      String? time, 
      int? staffId, 
      String? houseNo, 
      String? street, 
      String? townCity, 
      String? postCode, 
      int? serviceId, 
      int? price, 
      int? duration, 
      String? notes,}){
    _customerId = customerId;
    _date = date;
    _time = time;
    _staffId = staffId;
    _houseNo = houseNo;
    _street = street;
    _townCity = townCity;
    _postCode = postCode;
    _serviceId = serviceId;
    _price = price;
    _duration = duration;
    _notes = notes;
}

  set customerId(int? value) {
    _customerId = value;
  }

  DataNewAppointment.fromJson(dynamic json) {
    _customerId = json['customerId'];
    _date = json['date'];
    _time = json['time'];
    _staffId = json['staffId'];
    _houseNo = json['houseNo'];
    _street = json['street'];
    _townCity = json['townCity'];
    _postCode = json['postCode'];
    _serviceId = json['serviceId'];
    _price = json['price'];
    _duration = json['duration'];
    _notes = json['notes'];
  }
  int? _customerId;
  String? _date;
  String? _time;
  int? _staffId;
  String? _houseNo;
  String? _street;
  String? _townCity;
  String? _postCode;
  int? _serviceId;
  int? _price;
  int? _duration;
  String? _notes;
  DataNewAppointment copyWith({  int? customerId,
  String? date,
  String? time,
  int? staffId,
  String? houseNo,
  String? street,
  String? townCity,
  String? postCode,
  int? serviceId,
  int? price,
  int? duration,
  String? notes,
}) => DataNewAppointment(  customerId: customerId ?? _customerId,
  date: date ?? _date,
  time: time ?? _time,
  staffId: staffId ?? _staffId,
  houseNo: houseNo ?? _houseNo,
  street: street ?? _street,
  townCity: townCity ?? _townCity,
  postCode: postCode ?? _postCode,
  serviceId: serviceId ?? _serviceId,
  price: price ?? _price,
  duration: duration ?? _duration,
  notes: notes ?? _notes,
);
  int? get customerId => _customerId;
  String? get date => _date;
  String? get time => _time;
  int? get staffId => _staffId;
  String? get houseNo => _houseNo;
  String? get street => _street;
  String? get townCity => _townCity;
  String? get postCode => _postCode;
  int? get serviceId => _serviceId;
  int? get price => _price;
  int? get duration => _duration;
  String? get notes => _notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerId'] = _customerId;
    map['date'] = _date;
    map['time'] = _time;
    map['staffId'] = _staffId;
    map['houseNo'] = _houseNo;
    map['street'] = _street;
    map['townCity'] = _townCity;
    map['postCode'] = _postCode;
    map['serviceId'] = _serviceId;
    map['price'] = _price;
    map['duration'] = _duration;
    map['notes'] = _notes;
    return map;
  }

  set date(String? value) {
    _date = value;
  }

  set time(String? value) {
    _time = value;
  }

  set staffId(int? value) {
    _staffId = value;
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

  set serviceId(int? value) {
    _serviceId = value;
  }

  set price(int? value) {
    _price = value;
  }

  set duration(int? value) {
    _duration = value;
  }

  set notes(String? value) {
    _notes = value;
  }
}