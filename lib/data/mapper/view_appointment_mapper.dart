
import 'package:pamperbook/data/models/response/view_appoitment/ViewAppoitmentListResponse.dart';

class ViewAppointmentMapper {


  List<Appointment>? _customer;

  List<Appointment>? get customer => _customer;

  set customer(List<Appointment>? value) {
    _customer = value;
  }

  List<Filters>? _filters;


  ViewAppointmentMapper({
    List<Appointment>? customer,
    List<Filters>? filters


  }) {
    _customer = customer;
    _filters = filters;
  }


  ViewAppointmentMapper copyWith({
    List<Appointment>? customer,
    List<Filters>? filters


  }) =>

      ViewAppointmentMapper(
          customer: customer ?? _customer,
          filters: filters ?? _filters,

      );

  List<Filters>? get filters => _filters;

  set filters(List<Filters>? value) {
    _filters = value;
  }
}

class Filters {
  bool? _isSelected;
  String? _item;

  bool? get isSelected => _isSelected;

  set isSelected(bool? value) {
    _isSelected = value;
  }

  Filters({
    bool? isSelected,
    String? item,
   }){
    _isSelected = isSelected;
    _item = item;
  }

  String? get item => _item;

  set item(String? value) {
    _item = value;
  }
}
class Appointment {
  int? _id;
  String? _appointmentTime;
  String? _serviceName;
  String? _status;

  int? get id => _id;
  String? _customerName;

  Appointment({
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

  String? get appointmentTime => _appointmentTime;

  String? get serviceName => _serviceName;

  String? get status => _status;

  String? get customerName => _customerName;
}