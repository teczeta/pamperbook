import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pamperbook/data/models/response/get_appointment_details/GetAppointmentDetailsResponse.dart';

class GetAppointmentDetailsMapper {
  List<Customer>? _customer;
  List<Staff>? _staffs;
  List<Service>? _service;
  Customer? _initialCustomerValue;
  Service? _initialServiceValue;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  TimeOfDay? get selectedTime => _selectedTime;

  bool? get showLoader => _showLoader;

  set showLoader(bool? value) {
    _showLoader = value;
  }

  bool? _showLoader;

  set selectedTime(TimeOfDay? value) {
    _selectedTime = value;
  }

  DateTime? get selectedDate => _selectedDate;

  set selectedDate(DateTime? value) {
    _selectedDate = value;
  }

  set service(List<Service>? value) {
    _service = value;
  }

  List<Service>? get service => _service;
  Staff? _initialStaffValue;


  GetAppointmentDetailsMapper({
    List<Customer>? customers,
    List<Staff>? staffs,
    List<Service>? service,
    Customer? initialCustomerValue,
    Staff? initialStaffValue,
    Service? initialServiceValue,
    DateTime? selectedDate,
    TimeOfDay? selectedTime,
    bool? showLoader

  }) {
    _customer = customers;
    _staffs = staffs;
    _service = service;
    _initialCustomerValue = initialCustomerValue;
    _initialStaffValue = initialStaffValue;
    _initialServiceValue = initialServiceValue;
    _selectedDate = selectedDate;
    _selectedTime = selectedTime;
    _showLoader = showLoader;
  }
  GetAppointmentDetailsMapper copyWith({
    List<Customer>? customers,
    List<Staff>? staffs,
    Customer? initialCustomerValue,
    Staff? initialStaffValue,
    Service? initialServiceValue,
    DateTime? selectedDate,
    TimeOfDay? selectedTime,
    bool? showLoader

  }) =>

  GetAppointmentDetailsMapper(
    customers: customers ?? _customer,
    staffs: staffs ?? _staffs,
    service: service ?? _service,
    initialCustomerValue: initialCustomerValue ?? _initialCustomerValue,

    initialStaffValue: initialStaffValue ?? _initialStaffValue,
    initialServiceValue: initialServiceValue ?? _initialServiceValue,
    selectedDate: selectedDate ?? _selectedDate,
    selectedTime: selectedTime ?? _selectedTime,
    showLoader: showLoader ?? _showLoader

  );


  Customer? get initialCustomerValue => _initialCustomerValue;
  Service? get initialServiceValue => _initialServiceValue;
  Staff? get initialStaffValue => _initialStaffValue;

  set initialCustomerValue(Customer? value) {
    _initialCustomerValue = value;
  }

  List<Staff>? get staffs => _staffs;

  set staffs(List<Staff>? value) {
    _staffs = value;
  }

  set initialServiceValue(Service? value) {
    _initialServiceValue = value;
  }

  List<Customer>? get customer => _customer;

  set customer(List<Customer>? value) {
    _customer = value;
  }

  set initialStaffValue(Staff? value) {
    _initialStaffValue = value;
  }
}

class Customer {
  int? _id;
  String? _name;

  Customer({
    int? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Customer copyWith({
    int? id,
    String? name,
  }) =>
      Customer(
        id: id ?? _id,
        name: name ?? _name,
      );

  int? get id => _id;

  String? get name => _name;
}

class Staff {
  int? _id;
  String? _name;

  Staff({
    int? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Staffs copyWith({
    int? id,
    String? name,
  }) =>
      Staffs(
        id: id ?? _id,
        name: name ?? _name,
      );

  int? get id => _id;

  String? get name => _name;
}
class Service {
  int? _id;
  int? _price;
  int? _duration;
  String? _name;

  Service({
    int? id,
    int? price,
    int? duration,
    String? name,
  }) {
    _id = id;
    _name = name;
    _price = price;
    _duration = duration;
  }

  int? get price => _price;

  set price(int? value) {
    _price = value;
  }

  Service copyWith({
    int? id,
    int? price,
    int? duration,
    String? name,
  }) =>
      Service(
        id: id ?? _id,
        name: name ?? _name,
        price: price ?? _price,
        duration: duration ?? _duration,

      );

  int? get id => _id;

  String? get name => _name;

  int? get duration => _duration;

  set duration(int? value) {
    _duration = value;
  }
}
