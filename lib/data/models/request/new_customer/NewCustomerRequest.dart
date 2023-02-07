import 'dart:convert';
/// action : "addCustomer"
/// data : {"firstName":"john","lastName":"john","email":"john@qwe.qwe","phone":"1231231231","note":"john"}

NewCustomerRequest newCustomerRequestFromJson(String str) => NewCustomerRequest.fromJson(json.decode(str));
String newCustomerRequestToJson(NewCustomerRequest data) => json.encode(data.toJson());
class NewCustomerRequest {
  NewCustomerRequest({
      String? action, 
      Data? data,}){
    _action = action;
    _data = data;
}

  NewCustomerRequest.fromJson(dynamic json) {
    _action = json['action'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _action;
  Data? _data;
NewCustomerRequest copyWith({  String? action,
  Data? data,
}) => NewCustomerRequest(  action: action ?? _action,
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

/// firstName : "john"
/// lastName : "john"
/// email : "john@qwe.qwe"
/// phone : "1231231231"
/// note : "john"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? firstName, 
      String? lastName, 
      String? email, 
      String? phone, 
      String? note,}){
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phone = phone;
    _note = note;
}

  Data.fromJson(dynamic json) {
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _phone = json['phone'];
    _note = json['note'];
  }
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phone;
  String? _note;
Data copyWith({  String? firstName,
  String? lastName,
  String? email,
  String? phone,
  String? note,
}) => Data(  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  phone: phone ?? _phone,
  note: note ?? _note,
);
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;

  set firstName(String? value) {
    _firstName = value;
  }

  String? get phone => _phone;
  String? get note => _note;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['phone'] = _phone;
    map['note'] = _note;
    return map;
  }

  set lastName(String? value) {
    _lastName = value;
  }

  set email(String? value) {
    _email = value;
  }

  set phone(String? value) {
    _phone = value;
  }

  set note(String? value) {
    _note = value;
  }
}