import 'dart:convert';
/// error : false
/// code : 2000
/// message : "Success"
/// data : {"customers":[{"id":2,"name":"Test Customer-TEMP"},{"id":13,"name":"Hulk Hogan"},{"id":83,"name":"Margaret Thatcher"},{"id":109,"name":"Kate Jones"},{"id":110,"name":"Kate Jones"},{"id":4,"name":"Test Customer-PERM-EMAIL"},{"id":152,"name":"Braden Holtby"},{"id":153,"name":"Some Customer"},{"id":382,"name":"test customer"},{"id":435,"name":"John Major"},{"id":481,"name":"Carol Bramwell"},{"id":484,"name":"Carol Bramwell"},{"id":12806,"name":"NewCustomer NewCustomer"},{"id":12817,"name":"NewCustomer2 NewCustomer2"},{"id":20636,"name":"Jajsbs Nzkzjz"},{"id":20638,"name":"Jajsbs Nzkzjz"},{"id":20639,"name":"Jajsbs Nzkzjz"},{"id":20640,"name":"Jajsbs Hhxx"},{"id":20641,"name":"Jajsbs Hhxx"},{"id":20642,"name":"Jajsbs Hhxx"},{"id":20650,"name":"Jajsbs Hhxx"},{"id":20651,"name":"Jajsbs Hhxx"},{"id":20652,"name":"Jajsbs Hhxx"},{"id":20653,"name":"Jajsbs Hhxx"},{"id":20654,"name":"Jajsbs Hhxx"},{"id":20656,"name":"Jajsbs Hhxx"},{"id":20657,"name":"Jajsbs Hh"},{"id":20658,"name":"Nzjzjz Nzjzjz"},{"id":20659,"name":"Kzoshz Jzosnx"},{"id":20661,"name":"Jajsbs Jaisjzb"},{"id":20662,"name":"Jajsbs Jaisjzb"},{"id":20664,"name":"Jahzhz Jzosnx"},{"id":20665,"name":"Jahzhz Jzosnx"},{"id":39134,"name":"Marc-Andre Fleury"},{"id":39486,"name":"William Karlsson"},{"id":44140,"name":"Matt Kirwan"},{"id":44142,"name":"Marc-andre Kirwan"},{"id":47313,"name":"Test Customer"},{"id":47788,"name":"Test Customer"},{"id":47789,"name":"Test Customer"},{"id":51536,"name":"William Karlsson"},{"id":57208,"name":"Test Test"}],"staffs":[{"id":1,"name":"Nadia Test"},{"id":36,"name":"Test Staff"},{"id":37,"name":"Roman Test"},{"id":730,"name":"Matt 1"},{"id":731,"name":"Matt 2"},{"id":732,"name":"Matt 3"},{"id":733,"name":"Matt 4"},{"id":898,"name":"MattTest KirwanTest"},{"id":960,"name":"NowStaffMember NowStaffMember"},{"id":961,"name":"NewStaff2 NewStaff2"}],"services":[{"id":1,"name":"Standard Haircut","duration":30,"price":2000},{"id":3,"name":"HD","duration":45,"price":3500},{"id":602,"name":"Cut & Blow Dry","duration":45,"price":2500},{"id":2427,"name":"Cut & Colour","duration":125,"price":11000},{"id":13379,"name":"Gent's Haircut","duration":30,"price":2000},{"id":13380,"name":"Skin Fade","duration":30,"price":1300},{"id":17498,"name":"Quick Pluck","duration":10,"price":650},{"id":17499,"name":"Colour Consultation","duration":30,"price":0}]}

GetAppointmentDetailsResponse getAppointmentDetailsResponseFromJson(String str) => GetAppointmentDetailsResponse.fromJson(json.decode(str));
String getAppointmentDetailsResponseToJson(GetAppointmentDetailsResponse data) => json.encode(data.toJson());
class GetAppointmentDetailsResponse {
  GetAppointmentDetailsResponse({
      bool? error, 
      int? code, 
      String? message, 
      Data? data,}){
    _error = error;
    _code = code;
    _message = message;
    _data = data;
}

  GetAppointmentDetailsResponse.fromJson(dynamic json) {
    _error = json['error'];
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  int? _code;
  String? _message;
  Data? _data;
GetAppointmentDetailsResponse copyWith({  bool? error,
  int? code,
  String? message,
  Data? data,
}) => GetAppointmentDetailsResponse(  error: error ?? _error,
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

/// customers : [{"id":2,"name":"Test Customer-TEMP"},{"id":13,"name":"Hulk Hogan"},{"id":83,"name":"Margaret Thatcher"},{"id":109,"name":"Kate Jones"},{"id":110,"name":"Kate Jones"},{"id":4,"name":"Test Customer-PERM-EMAIL"},{"id":152,"name":"Braden Holtby"},{"id":153,"name":"Some Customer"},{"id":382,"name":"test customer"},{"id":435,"name":"John Major"},{"id":481,"name":"Carol Bramwell"},{"id":484,"name":"Carol Bramwell"},{"id":12806,"name":"NewCustomer NewCustomer"},{"id":12817,"name":"NewCustomer2 NewCustomer2"},{"id":20636,"name":"Jajsbs Nzkzjz"},{"id":20638,"name":"Jajsbs Nzkzjz"},{"id":20639,"name":"Jajsbs Nzkzjz"},{"id":20640,"name":"Jajsbs Hhxx"},{"id":20641,"name":"Jajsbs Hhxx"},{"id":20642,"name":"Jajsbs Hhxx"},{"id":20650,"name":"Jajsbs Hhxx"},{"id":20651,"name":"Jajsbs Hhxx"},{"id":20652,"name":"Jajsbs Hhxx"},{"id":20653,"name":"Jajsbs Hhxx"},{"id":20654,"name":"Jajsbs Hhxx"},{"id":20656,"name":"Jajsbs Hhxx"},{"id":20657,"name":"Jajsbs Hh"},{"id":20658,"name":"Nzjzjz Nzjzjz"},{"id":20659,"name":"Kzoshz Jzosnx"},{"id":20661,"name":"Jajsbs Jaisjzb"},{"id":20662,"name":"Jajsbs Jaisjzb"},{"id":20664,"name":"Jahzhz Jzosnx"},{"id":20665,"name":"Jahzhz Jzosnx"},{"id":39134,"name":"Marc-Andre Fleury"},{"id":39486,"name":"William Karlsson"},{"id":44140,"name":"Matt Kirwan"},{"id":44142,"name":"Marc-andre Kirwan"},{"id":47313,"name":"Test Customer"},{"id":47788,"name":"Test Customer"},{"id":47789,"name":"Test Customer"},{"id":51536,"name":"William Karlsson"},{"id":57208,"name":"Test Test"}]
/// staffs : [{"id":1,"name":"Nadia Test"},{"id":36,"name":"Test Staff"},{"id":37,"name":"Roman Test"},{"id":730,"name":"Matt 1"},{"id":731,"name":"Matt 2"},{"id":732,"name":"Matt 3"},{"id":733,"name":"Matt 4"},{"id":898,"name":"MattTest KirwanTest"},{"id":960,"name":"NowStaffMember NowStaffMember"},{"id":961,"name":"NewStaff2 NewStaff2"}]
/// services : [{"id":1,"name":"Standard Haircut","duration":30,"price":2000},{"id":3,"name":"HD","duration":45,"price":3500},{"id":602,"name":"Cut & Blow Dry","duration":45,"price":2500},{"id":2427,"name":"Cut & Colour","duration":125,"price":11000},{"id":13379,"name":"Gent's Haircut","duration":30,"price":2000},{"id":13380,"name":"Skin Fade","duration":30,"price":1300},{"id":17498,"name":"Quick Pluck","duration":10,"price":650},{"id":17499,"name":"Colour Consultation","duration":30,"price":0}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      List<Customers>? customers, 
      List<Staffs>? staffs, 
      List<Services>? services,}){
    _customers = customers;
    _staffs = staffs;
    _services = services;
}

  Data.fromJson(dynamic json) {
    if (json['customers'] != null) {
      _customers = [];
      json['customers'].forEach((v) {
        _customers?.add(Customers.fromJson(v));
      });
    }
    if (json['staffs'] != null) {
      _staffs = [];
      json['staffs'].forEach((v) {
        _staffs?.add(Staffs.fromJson(v));
      });
    }
    if (json['services'] != null) {
      _services = [];
      json['services'].forEach((v) {
        _services?.add(Services.fromJson(v));
      });
    }
  }
  List<Customers>? _customers;
  List<Staffs>? _staffs;
  List<Services>? _services;
Data copyWith({  List<Customers>? customers,
  List<Staffs>? staffs,
  List<Services>? services,
}) => Data(  customers: customers ?? _customers,
  staffs: staffs ?? _staffs,
  services: services ?? _services,
);
  List<Customers>? get customers => _customers;
  List<Staffs>? get staffs => _staffs;
  List<Services>? get services => _services;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_customers != null) {
      map['customers'] = _customers?.map((v) => v.toJson()).toList();
    }
    if (_staffs != null) {
      map['staffs'] = _staffs?.map((v) => v.toJson()).toList();
    }
    if (_services != null) {
      map['services'] = _services?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "Standard Haircut"
/// duration : 30
/// price : 2000

Services servicesFromJson(String str) => Services.fromJson(json.decode(str));
String servicesToJson(Services data) => json.encode(data.toJson());
class Services {
  Services({
      int? id, 
      String? name, 
      int? duration, 
      int? price,}){
    _id = id;
    _name = name;
    _duration = duration;
    _price = price;
}

  Services.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _duration = json['duration'];
    _price = json['price'];
  }
  int? _id;
  String? _name;
  int? _duration;
  int? _price;
Services copyWith({  int? id,
  String? name,
  int? duration,
  int? price,
}) => Services(  id: id ?? _id,
  name: name ?? _name,
  duration: duration ?? _duration,
  price: price ?? _price,
);
  int? get id => _id;
  String? get name => _name;
  int? get duration => _duration;
  int? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['duration'] = _duration;
    map['price'] = _price;
    return map;
  }

}

/// id : 1
/// name : "Nadia Test"

Staffs staffsFromJson(String str) => Staffs.fromJson(json.decode(str));
String staffsToJson(Staffs data) => json.encode(data.toJson());
class Staffs {
  Staffs({
      int? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Staffs.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  int? _id;
  String? _name;
Staffs copyWith({  int? id,
  String? name,
}) => Staffs(  id: id ?? _id,
  name: name ?? _name,
);
  int? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}

/// id : 2
/// name : "Test Customer-TEMP"

Customers customersFromJson(String str) => Customers.fromJson(json.decode(str));
String customersToJson(Customers data) => json.encode(data.toJson());
class Customers {
  Customers({
      int? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Customers.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  int? _id;
  String? _name;
Customers copyWith({  int? id,
  String? name,
}) => Customers(  id: id ?? _id,
  name: name ?? _name,
);
  int? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}