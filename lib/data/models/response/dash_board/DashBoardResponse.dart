import 'dart:convert';
/// error : false
/// code : 2000
/// message : "Success"
/// data : {"is_registration_complete":true,"account_status":"Expires: 31-Dec-2022","pending_appointments_count":22,"upcoming_appointments":[{"id":528631,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"},{"id":528632,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"},{"id":528633,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"},{"id":528634,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"},{"id":528641,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"},{"id":528642,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"},{"id":528643,"appointment_time":"Wed, 18th Jan 2023, 11:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528644,"appointment_time":"Wed, 18th Jan 2023, 11:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528645,"appointment_time":"Wed, 18th Jan 2023, 11:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528646,"appointment_time":"Wed, 18th Jan 2023, 11:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528647,"appointment_time":"Thu, 19th Jan 2023, 07:01 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Liam Mitchell"},{"id":528648,"appointment_time":"Thu, 19th Jan 2023, 07:01 PM","service_name":"Cut & Blow Dry","status":"PENDING","customer_name":"Liam Mitchell"},{"id":528649,"appointment_time":"Thu, 19th Jan 2023, 08:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528650,"appointment_time":"Thu, 19th Jan 2023, 08:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528651,"appointment_time":"Thu, 19th Jan 2023, 08:01 PM","service_name":"Cut & Blow Dry","status":"PENDING","customer_name":"Jenny Jones"},{"id":528652,"appointment_time":"Tue, 31st Jan 2023, 04:01 AM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528653,"appointment_time":"Thu, 19th Jan 2023, 09:01 PM","service_name":"HD","status":"PENDING","customer_name":"Liam Mitchell"},{"id":528654,"appointment_time":"Thu, 19th Jan 2023, 11:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528655,"appointment_time":"Thu, 19th Jan 2023, 11:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528656,"appointment_time":"Thu, 19th Jan 2023, 11:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528657,"appointment_time":"Sat, 28th Jan 2023, 09:01 PM","service_name":"Cut & Blow Dry","status":"PENDING","customer_name":"Jenny Jones"},{"id":528658,"appointment_time":"Sat, 28th Jan 2023, 09:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"}],"approved_appointments":[{"id":528640,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"APPROVED","customer_name":"Jenny Jones"},{"id":528635,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"APPROVED","customer_name":"Jenny Jones"},{"id":528636,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"APPROVED","customer_name":"Jenny Jones"},{"id":528637,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"APPROVED","customer_name":"Jenny Jones"},{"id":528638,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"APPROVED","customer_name":"Jenny Jones"}]}

DashBoardResponse dashBoardResponseFromJson(String str) => DashBoardResponse.fromJson(json.decode(str));
String dashBoardResponseToJson(DashBoardResponse data) => json.encode(data.toJson());
class DashBoardResponse {
  DashBoardResponse({
      bool? error, 
      int? code, 
      String? message, 
      Data? data,}){
    _error = error;
    _code = code;
    _message = message;
    _data = data;
}

  DashBoardResponse.fromJson(dynamic json) {
    _error = json['error'];
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  int? _code;
  String? _message;
  Data? _data;
DashBoardResponse copyWith({  bool? error,
  int? code,
  String? message,
  Data? data,
}) => DashBoardResponse(  error: error ?? _error,
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

/// is_registration_complete : true
/// account_status : "Expires: 31-Dec-2022"
/// pending_appointments_count : 22
/// upcoming_appointments : [{"id":528631,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"},{"id":528632,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"},{"id":528633,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"},{"id":528634,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"},{"id":528641,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"},{"id":528642,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Jenny Jones"},{"id":528643,"appointment_time":"Wed, 18th Jan 2023, 11:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528644,"appointment_time":"Wed, 18th Jan 2023, 11:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528645,"appointment_time":"Wed, 18th Jan 2023, 11:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528646,"appointment_time":"Wed, 18th Jan 2023, 11:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528647,"appointment_time":"Thu, 19th Jan 2023, 07:01 PM","service_name":"Standard Haircut","status":"PENDING","customer_name":"Liam Mitchell"},{"id":528648,"appointment_time":"Thu, 19th Jan 2023, 07:01 PM","service_name":"Cut & Blow Dry","status":"PENDING","customer_name":"Liam Mitchell"},{"id":528649,"appointment_time":"Thu, 19th Jan 2023, 08:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528650,"appointment_time":"Thu, 19th Jan 2023, 08:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528651,"appointment_time":"Thu, 19th Jan 2023, 08:01 PM","service_name":"Cut & Blow Dry","status":"PENDING","customer_name":"Jenny Jones"},{"id":528652,"appointment_time":"Tue, 31st Jan 2023, 04:01 AM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528653,"appointment_time":"Thu, 19th Jan 2023, 09:01 PM","service_name":"HD","status":"PENDING","customer_name":"Liam Mitchell"},{"id":528654,"appointment_time":"Thu, 19th Jan 2023, 11:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528655,"appointment_time":"Thu, 19th Jan 2023, 11:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528656,"appointment_time":"Thu, 19th Jan 2023, 11:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"},{"id":528657,"appointment_time":"Sat, 28th Jan 2023, 09:01 PM","service_name":"Cut & Blow Dry","status":"PENDING","customer_name":"Jenny Jones"},{"id":528658,"appointment_time":"Sat, 28th Jan 2023, 09:01 PM","service_name":"Cut & Colour","status":"PENDING","customer_name":"Jenny Jones"}]
/// approved_appointments : [{"id":528640,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"APPROVED","customer_name":"Jenny Jones"},{"id":528635,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"APPROVED","customer_name":"Jenny Jones"},{"id":528636,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"APPROVED","customer_name":"Jenny Jones"},{"id":528637,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"APPROVED","customer_name":"Jenny Jones"},{"id":528638,"appointment_time":"Fri, 22nd Dec 2023, 03:12 PM","service_name":"Standard Haircut","status":"APPROVED","customer_name":"Jenny Jones"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      bool? isRegistrationComplete, 
      String? accountStatus, 
      int? pendingAppointmentsCount, 
      List<UpcomingAppointments>? upcomingAppointments, 
      List<ApprovedAppointments>? approvedAppointments,}){
    _isRegistrationComplete = isRegistrationComplete;
    _accountStatus = accountStatus;
    _pendingAppointmentsCount = pendingAppointmentsCount;
    _upcomingAppointments = upcomingAppointments;
    _approvedAppointments = approvedAppointments;
}

  Data.fromJson(dynamic json) {
    _isRegistrationComplete = json['is_registration_complete'];
    _accountStatus = json['account_status'];
    _pendingAppointmentsCount = json['pending_appointments_count'];
    if (json['upcoming_appointments'] != null) {
      _upcomingAppointments = [];
      json['upcoming_appointments'].forEach((v) {
        _upcomingAppointments?.add(UpcomingAppointments.fromJson(v));
      });
    }
    if (json['approved_appointments'] != null) {
      _approvedAppointments = [];
      json['approved_appointments'].forEach((v) {
        _approvedAppointments?.add(ApprovedAppointments.fromJson(v));
      });
    }
  }
  bool? _isRegistrationComplete;
  String? _accountStatus;
  int? _pendingAppointmentsCount;
  List<UpcomingAppointments>? _upcomingAppointments;
  List<ApprovedAppointments>? _approvedAppointments;
Data copyWith({  bool? isRegistrationComplete,
  String? accountStatus,
  int? pendingAppointmentsCount,
  List<UpcomingAppointments>? upcomingAppointments,
  List<ApprovedAppointments>? approvedAppointments,
}) => Data(  isRegistrationComplete: isRegistrationComplete ?? _isRegistrationComplete,
  accountStatus: accountStatus ?? _accountStatus,
  pendingAppointmentsCount: pendingAppointmentsCount ?? _pendingAppointmentsCount,
  upcomingAppointments: upcomingAppointments ?? _upcomingAppointments,
  approvedAppointments: approvedAppointments ?? _approvedAppointments,
);
  bool? get isRegistrationComplete => _isRegistrationComplete;
  String? get accountStatus => _accountStatus;
  int? get pendingAppointmentsCount => _pendingAppointmentsCount;
  List<UpcomingAppointments>? get upcomingAppointments => _upcomingAppointments;
  List<ApprovedAppointments>? get approvedAppointments => _approvedAppointments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_registration_complete'] = _isRegistrationComplete;
    map['account_status'] = _accountStatus;
    map['pending_appointments_count'] = _pendingAppointmentsCount;
    if (_upcomingAppointments != null) {
      map['upcoming_appointments'] = _upcomingAppointments?.map((v) => v.toJson()).toList();
    }
    if (_approvedAppointments != null) {
      map['approved_appointments'] = _approvedAppointments?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 528640
/// appointment_time : "Fri, 22nd Dec 2023, 03:12 PM"
/// service_name : "Standard Haircut"
/// status : "APPROVED"
/// customer_name : "Jenny Jones"

ApprovedAppointments approvedAppointmentsFromJson(String str) => ApprovedAppointments.fromJson(json.decode(str));
String approvedAppointmentsToJson(ApprovedAppointments data) => json.encode(data.toJson());
class ApprovedAppointments {
  ApprovedAppointments({
      int? id, 
      String? appointmentTime, 
      String? serviceName, 
      String? status, 
      String? customerName,}){
    _id = id;
    _appointmentTime = appointmentTime;
    _serviceName = serviceName;
    _status = status;
    _customerName = customerName;
}

  ApprovedAppointments.fromJson(dynamic json) {
    _id = json['id'];
    _appointmentTime = json['appointment_time'];
    _serviceName = json['service_name'];
    _status = json['status'];
    _customerName = json['customer_name'];
  }
  int? _id;
  String? _appointmentTime;
  String? _serviceName;
  String? _status;
  String? _customerName;
ApprovedAppointments copyWith({  int? id,
  String? appointmentTime,
  String? serviceName,
  String? status,
  String? customerName,
}) => ApprovedAppointments(  id: id ?? _id,
  appointmentTime: appointmentTime ?? _appointmentTime,
  serviceName: serviceName ?? _serviceName,
  status: status ?? _status,
  customerName: customerName ?? _customerName,
);
  int? get id => _id;
  String? get appointmentTime => _appointmentTime;
  String? get serviceName => _serviceName;
  String? get status => _status;
  String? get customerName => _customerName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['appointment_time'] = _appointmentTime;
    map['service_name'] = _serviceName;
    map['status'] = _status;
    map['customer_name'] = _customerName;
    return map;
  }

}

/// id : 528631
/// appointment_time : "Fri, 22nd Dec 2023, 03:12 PM"
/// service_name : "Standard Haircut"
/// status : "PENDING"
/// customer_name : "Jenny Jones"

UpcomingAppointments upcomingAppointmentsFromJson(String str) => UpcomingAppointments.fromJson(json.decode(str));
String upcomingAppointmentsToJson(UpcomingAppointments data) => json.encode(data.toJson());
class UpcomingAppointments {
  UpcomingAppointments({
      int? id, 
      String? appointmentTime, 
      String? serviceName, 
      String? status, 
      String? customerName,}){
    _id = id;
    _appointmentTime = appointmentTime;
    _serviceName = serviceName;
    _status = status;
    _customerName = customerName;
}

  UpcomingAppointments.fromJson(dynamic json) {
    _id = json['id'];
    _appointmentTime = json['appointment_time'];
    _serviceName = json['service_name'];
    _status = json['status'];
    _customerName = json['customer_name'];
  }
  int? _id;
  String? _appointmentTime;
  String? _serviceName;
  String? _status;
  String? _customerName;
UpcomingAppointments copyWith({  int? id,
  String? appointmentTime,
  String? serviceName,
  String? status,
  String? customerName,
}) => UpcomingAppointments(  id: id ?? _id,
  appointmentTime: appointmentTime ?? _appointmentTime,
  serviceName: serviceName ?? _serviceName,
  status: status ?? _status,
  customerName: customerName ?? _customerName,
);
  int? get id => _id;
  String? get appointmentTime => _appointmentTime;
  String? get serviceName => _serviceName;
  String? get status => _status;
  String? get customerName => _customerName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['appointment_time'] = _appointmentTime;
    map['service_name'] = _serviceName;
    map['status'] = _status;
    map['customer_name'] = _customerName;
    return map;
  }

}