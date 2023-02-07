import 'dart:convert';

import 'package:flutter/material.dart';
/// error : false
/// code : 2000
/// showLoader : false
/// message : "Success"
/// data : {"id":528627,"name":"Jenny Jones","mobile":"+447931732808","email":null,"houseNo":"123","street":"123","townCity":"123","postCode":"123","status":"PENDING","ref":528627,"staffName":"Nadia Test","service":"Standard Haircut","price":2000,"duration":30,"date":"2023-12-22","time":"15:45","notes":null}

EditAppointmentDetailsResponse editAppointmentDetailsResponseFromJson(String str) => EditAppointmentDetailsResponse.fromJson(json.decode(str));
String editAppointmentDetailsResponseToJson(EditAppointmentDetailsResponse data) => json.encode(data.toJson());
class EditAppointmentDetailsResponse {
  EditAppointmentDetailsResponse({
      bool? error, 
      int? code, 
      bool? showLoader, 
      String? message, 
      Data? data,
    DateTime? selectedDate,
    TimeOfDay? selectedTime
  }){
    _error = error;
    _code = code;
    _showLoader = showLoader;
    _message = message;
    _data = data;
    _selectedDate =selectedDate;
    _selectedTime =selectedTime;

}

  DateTime? get selectedDate => _selectedDate;

  set selectedDate(DateTime? value) {
    _selectedDate = value;
  }

  EditAppointmentDetailsResponse.fromJson(dynamic json) {
    _error = json['error'];
    _code = json['code'];
    _showLoader = json['showLoader'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  int? _code;
  bool? _showLoader;
  String? _message;
  Data? _data;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
EditAppointmentDetailsResponse copyWith({  bool? error,
  int? code,
  bool? showLoader,
  String? message,
  Data? data,
  DateTime? selectedDate,
  TimeOfDay? selectedTime
}) => EditAppointmentDetailsResponse(  error: error ?? _error,
  code: code ?? _code,
  showLoader: showLoader ?? _showLoader,
  message: message ?? _message,
  data: data ?? _data,
  selectedDate: selectedDate ?? _selectedDate,
  selectedTime: selectedTime ?? _selectedTime,
);
  bool? get error => _error;
  int? get code => _code;
  bool? get showLoader => _showLoader;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['code'] = _code;
    map['showLoader'] = _showLoader;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

  TimeOfDay? get selectedTime => _selectedTime;

  set selectedTime(TimeOfDay? value) {
    _selectedTime = value;
  }
}

/// id : 528627
/// name : "Jenny Jones"
/// mobile : "+447931732808"
/// email : null
/// houseNo : "123"
/// street : "123"
/// townCity : "123"
/// postCode : "123"
/// status : "PENDING"
/// ref : 528627
/// staffName : "Nadia Test"
/// service : "Standard Haircut"
/// price : 2000
/// duration : 30
/// date : "2023-12-22"
/// time : "15:45"
/// notes : null

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      String? name, 
      String? mobile, 
      dynamic email, 
      String? houseNo, 
      String? street, 
      String? townCity, 
      String? postCode, 
      String? status, 
      int? ref, 
      String? staffName, 
      String? service, 
      int? price, 
      int? duration, 
      String? date, 
      String? time, 
      dynamic notes,}){
    _id = id;
    _name = name;
    _mobile = mobile;
    _email = email;
    _houseNo = houseNo;
    _street = street;
    _townCity = townCity;
    _postCode = postCode;
    _status = status;
    _ref = ref;
    _staffName = staffName;
    _service = service;
    _price = price;
    _duration = duration;
    _date = date;
    _time = time;
    _notes = notes;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _mobile = json['mobile'];
    _email = json['email'];
    _houseNo = json['houseNo'];
    _street = json['street'];
    _townCity = json['townCity'];
    _postCode = json['postCode'];
    _status = json['status'];
    _ref = json['ref'];
    _staffName = json['staffName'];
    _service = json['service'];
    _price = json['price'];
    _duration = json['duration'];
    _date = json['date'];
    _time = json['time'];
    _notes = json['notes'];
  }
  int? _id;
  String? _name;
  String? _mobile;
  dynamic _email;
  String? _houseNo;
  String? _street;
  String? _townCity;
  String? _postCode;
  String? _status;
  int? _ref;
  String? _staffName;
  String? _service;
  int? _price;
  int? _duration;
  String? _date;
  String? _time;
  dynamic _notes;
Data copyWith({  int? id,
  String? name,
  String? mobile,
  dynamic email,
  String? houseNo,
  String? street,
  String? townCity,
  String? postCode,
  String? status,
  int? ref,
  String? staffName,
  String? service,
  int? price,
  int? duration,
  String? date,
  String? time,
  dynamic notes,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  mobile: mobile ?? _mobile,
  email: email ?? _email,
  houseNo: houseNo ?? _houseNo,
  street: street ?? _street,
  townCity: townCity ?? _townCity,
  postCode: postCode ?? _postCode,
  status: status ?? _status,
  ref: ref ?? _ref,
  staffName: staffName ?? _staffName,
  service: service ?? _service,
  price: price ?? _price,
  duration: duration ?? _duration,
  date: date ?? _date,
  time: time ?? _time,
  notes: notes ?? _notes,
);
  int? get id => _id;
  String? get name => _name;
  String? get mobile => _mobile;
  dynamic get email => _email;
  String? get houseNo => _houseNo;
  String? get street => _street;
  String? get townCity => _townCity;
  String? get postCode => _postCode;
  String? get status => _status;
  int? get ref => _ref;
  String? get staffName => _staffName;
  String? get service => _service;
  int? get price => _price;
  int? get duration => _duration;
  String? get date => _date;
  String? get time => _time;
  dynamic get notes => _notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['houseNo'] = _houseNo;
    map['street'] = _street;
    map['townCity'] = _townCity;
    map['postCode'] = _postCode;
    map['status'] = _status;
    map['ref'] = _ref;
    map['staffName'] = _staffName;
    map['service'] = _service;
    map['price'] = _price;
    map['duration'] = _duration;
    map['date'] = _date;
    map['time'] = _time;
    map['notes'] = _notes;
    return map;
  }

}