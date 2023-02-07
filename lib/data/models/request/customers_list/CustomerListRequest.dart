import 'dart:convert';
/// action : "customerList"
/// data : {"dummy":"Dummy"}

CustomerListRequest customerListRequestFromJson(String str) => CustomerListRequest.fromJson(json.decode(str));
String customerListRequestToJson(CustomerListRequest data) => json.encode(data.toJson());
class CustomerListRequest {
  CustomerListRequest({
      String? action, 
      Data? data,}){
    _action = action;
    _data = data;
}

  CustomerListRequest.fromJson(dynamic json) {
    _action = json['action'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _action;
  Data? _data;
CustomerListRequest copyWith({  String? action,
  Data? data,
}) => CustomerListRequest(  action: action ?? _action,
  data: data ?? _data,
);
  String? get action => _action;
  Data? get data => _data;

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

  set data(Data? value) {
    _data = value;
  }
}

/// dummy : "Dummy"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? dummy,}){
    _dummy = dummy;
}

  Data.fromJson(dynamic json) {
    _dummy = json['dummy'];
  }
  String? _dummy;
Data copyWith({  String? dummy,
}) => Data(  dummy: dummy ?? _dummy,
);
  String? get dummy => _dummy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dummy'] = _dummy;
    return map;
  }

}