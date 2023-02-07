import 'dart:convert';
/// error : false
/// code : 2000
/// message : "Success"
/// data : {"customers":[{"id":2,"name":"Test Customer-TEMP"},{"id":13,"name":"Hulk Hogan"},{"id":83,"name":"Margaret Thatcher"},{"id":109,"name":"Kate Jones"},{"id":110,"name":"Kate Jones"},{"id":4,"name":"Test Customer-PERM-EMAIL"},{"id":152,"name":"Braden Holtby"},{"id":153,"name":"Some Customer"},{"id":382,"name":"test customer"},{"id":435,"name":"John Major"},{"id":481,"name":"Carol Bramwell"},{"id":484,"name":"Carol Bramwell"},{"id":12806,"name":"NewCustomer NewCustomer"},{"id":12817,"name":"NewCustomer2 NewCustomer2"},{"id":20636,"name":"Jajsbs Nzkzjz"},{"id":20638,"name":"Jajsbs Nzkzjz"},{"id":20639,"name":"Jajsbs Nzkzjz"},{"id":20640,"name":"Jajsbs Hhxx"},{"id":20641,"name":"Jajsbs Hhxx"},{"id":20642,"name":"Jajsbs Hhxx"},{"id":20650,"name":"Jajsbs Hhxx"},{"id":20651,"name":"Jajsbs Hhxx"},{"id":20652,"name":"Jajsbs Hhxx"},{"id":20653,"name":"Jajsbs Hhxx"},{"id":20654,"name":"Jajsbs Hhxx"},{"id":20656,"name":"Jajsbs Hhxx"},{"id":20657,"name":"Jajsbs Hh"},{"id":20658,"name":"Nzjzjz Nzjzjz"},{"id":20659,"name":"Kzoshz Jzosnx"},{"id":20661,"name":"Jajsbs Jaisjzb"},{"id":20662,"name":"Jajsbs Jaisjzb"},{"id":20664,"name":"Jahzhz Jzosnx"},{"id":20665,"name":"Jahzhz Jzosnx"},{"id":39134,"name":"Marc-Andre Fleury"},{"id":39486,"name":"William Karlsson"},{"id":44140,"name":"Matt Kirwan"},{"id":44142,"name":"Marc-andre Kirwan"},{"id":47313,"name":"Test Customer"},{"id":47788,"name":"Test Customer"},{"id":47789,"name":"Test Customer"},{"id":51536,"name":"William Karlsson"},{"id":57208,"name":"Test Test"}]}

CustomerListResponse customerListResponseFromJson(String str) => CustomerListResponse.fromJson(json.decode(str));
String customerListResponseToJson(CustomerListResponse data) => json.encode(data.toJson());
class CustomerListResponse {
  CustomerListResponse({
      bool? error, 
      int? code, 
      String? message, 
      Data? data,}){
    _error = error;
    _code = code;
    _message = message;
    _data = data;
}

  CustomerListResponse.fromJson(dynamic json) {
    _error = json['error'];
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  int? _code;
  String? _message;
  Data? _data;
CustomerListResponse copyWith({  bool? error,
  int? code,
  String? message,
  Data? data,
}) => CustomerListResponse(  error: error ?? _error,
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

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      List<Customers>? customers,}){
    _customers = customers;
}

  Data.fromJson(dynamic json) {
    if (json['customers'] != null) {
      _customers = [];
      json['customers'].forEach((v) {
        _customers?.add(Customers.fromJson(v));
      });
    }
  }
  List<Customers>? _customers;
Data copyWith({  List<Customers>? customers,
}) => Data(  customers: customers ?? _customers,
);
  List<Customers>? get customers => _customers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_customers != null) {
      map['customers'] = _customers?.map((v) => v.toJson()).toList();
    }
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