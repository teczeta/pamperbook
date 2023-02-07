import 'dart:convert';
/// action : "dashboard"
/// data : {"dummy":"Dummy"}

DashBoardRequest dashBoardRequestFromJson(String str) => DashBoardRequest.fromJson(json.decode(str));
String dashBoardRequestToJson(DashBoardRequest data) => json.encode(data.toJson());
class DashBoardRequest {
  DashBoardRequest({
      String? action,
    DashBoardData? data,}){
    _action = action;
    _data = data;
}

  DashBoardRequest.fromJson(dynamic json) {
    _action = json['action'];
    _data = json['data'] != null ? DashBoardData.fromJson(json['data']) : null;
  }
  String? _action;
  DashBoardData? _data;
DashBoardRequest copyWith({  String? action,
  DashBoardData? data,
}) => DashBoardRequest(  action: action ?? _action,
  data: data ?? _data,
);
  String? get action => _action;

  set action(String? value) {
    _action = value;
  }

  DashBoardData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['action'] = _action;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

  set data(DashBoardData? value) {
    _data = value;
  }
}

/// dummy : "Dummy"

DashBoardData dataFromJson(String str) => DashBoardData.fromJson(json.decode(str));
String dataToJson(DashBoardData data) => json.encode(data.toJson());
class DashBoardData {
  DashBoardData({
      String? dummyNew,}){
    _dummy = dummyNew;
}

  DashBoardData.fromJson(dynamic json) {
    _dummy = json['dummyNew'];
  }
  String? _dummy;
  DashBoardData copyWith({  String? dummyNew,
}) => DashBoardData(  dummyNew: dummyNew ?? _dummy,
);
  String? get dummyNew => _dummy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dummyNew'] = _dummy;
    return map;
  }

}