import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pamperbook/data/mapper/get_appointment_details_mapper.dart';
import 'package:pamperbook/data/models/request/get_appointment_details/GetAppointmentDetailsRequest.dart';
import 'package:pamperbook/data/models/request/new_appointment/NewAppointmentRequest.dart';
import 'package:pamperbook/resources/api_repository.dart';
import '../../data/models/response/get_appointment_details/GetAppointmentDetailsResponse.dart';

part 'add_appointment_event.dart';

part 'add_appointment_state.dart';

class AddAppointmentBloc
    extends Bloc<AddAppointmentEvent, AddAppointmentState> {
  AddAppointmentBloc() : super(const AddAppointmentInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    GetAppointmentDetailsMapper appointmentDetailsMapper =
        GetAppointmentDetailsMapper();
    on<GetAppointmentDetailsResponseEvent>((event, emit) async {
      try {
        emit(AddAppointmentLoading());
        try {
          final getAppointmentListResponse =
              await _apiRepository.fetchGetAppointmentDetailsResponse(
                  event.getAppointmentDetailsRequest);

          var listCustomers = getAppointmentListResponse.data!.customers;
          var listStaffs = getAppointmentListResponse.data!.staffs;
          var listServices = getAppointmentListResponse.data!.services;

          List<Customer> listCustomer = [];
          List<Staff> listStaff = [];
          List<Service> listService = [];

          for (var customer in listCustomers!) {
            print(customer.name);
            Customer customers = Customer(id: customer.id, name: customer.name);
            listCustomer.add(customers);
          }
          for (var staff in listStaffs!) {
            print(staff.name);
            Staff staffs = Staff(id: staff.id, name: staff.name);
            listStaff.add(staffs);
          }
          for (var service in listServices!) {
            print(service.name);
            Service services = Service(
                id: service.id,
                name: service.name,
                duration: service.duration,
                price: service.price);
            listService.add(services);
          }

          appointmentDetailsMapper.customer = listCustomer;
          appointmentDetailsMapper.staffs = listStaff;
          appointmentDetailsMapper.service = listService;

          Customer customer = Customer(id: -1, name: "Select Customer");
          Staff staff = Staff(id: -1, name: "Select Staff");
          Service service = Service(id: -1, name: "Select Service");
          appointmentDetailsMapper.showLoader = false;
          appointmentDetailsMapper.initialCustomerValue = customer;
          appointmentDetailsMapper.initialStaffValue = staff;
          appointmentDetailsMapper.initialServiceValue = service;
          appointmentDetailsMapper.selectedDate = DateTime.now();
          appointmentDetailsMapper.selectedTime = TimeOfDay.now();

          emit(AddAppointmentLoaded(appointmentDetailsMapper));

        } catch (error, stackTrace) {
          emit(const AddAppointmentLoadedError(
              "Failed to fetch data. is your device online?"));
        }
      } on NetworkError {
        emit(const AddAppointmentLoadedError(
            "Failed to fetch data. is your device online?"));
      }
    });

    on<NewAppointmentResponseEvent>((event, emit) async {
      try {
       // GetAppointmentDetailsMapper getAppointmentDetailsMapper =  appointmentDetailsMapper.copyWith(showLoader: true);

      //  emit(AddAppointmentLoaded(getAppointmentDetailsMapper));

        emit(AddAppointmentLoading());

        try {
          final getAppointmentListResponse =
              await _apiRepository.fetchNewAppointmentResponse(
                  event.newAppointmentRequest);

        GetAppointmentDetailsMapper getAppointmentDetailsMapperNew =  appointmentDetailsMapper.copyWith(showLoader: true);
          emit(AddAppointmentLoaded(getAppointmentDetailsMapperNew));

        } catch (error, stackTrace) {
          emit(const AddAppointmentLoadedError(
              "Failed to fetch data. is your device online?"));
        }
      } on NetworkError {
        emit(const AddAppointmentLoadedError(
            "Failed to fetch data. is your device online?"));
      }
    });
    on<CustomerClickEvent>((event, emit) async {
      appointmentDetailsMapper.initialCustomerValue = event.customer;
      GetAppointmentDetailsMapper getAppointmentDetailsMapper =
          appointmentDetailsMapper.copyWith(
              initialCustomerValue: event.customer);
      emit(AddAppointmentLoaded(getAppointmentDetailsMapper));
    });
    on<StaffClickEvent>((event, emit) async {
      appointmentDetailsMapper.initialStaffValue  = event.staff;
      GetAppointmentDetailsMapper getAppointmentDetailsMapper =
          appointmentDetailsMapper.copyWith(initialStaffValue: event.staff);
      emit(AddAppointmentLoaded(getAppointmentDetailsMapper));
    });
    on<ServiceClickEvent>((event, emit) async {
      appointmentDetailsMapper.initialServiceValue = event.service;
      GetAppointmentDetailsMapper getAppointmentDetailsMapper =
          appointmentDetailsMapper.copyWith(initialServiceValue: event.service);
      emit(AddAppointmentLoaded(getAppointmentDetailsMapper));
    });

    on<DateTimeClickEvent>((event, emit) async {
      GetAppointmentDetailsMapper getAppointmentDetailsMapper =
          appointmentDetailsMapper.copyWith(selectedDate: event.selectedDate);
      emit(AddAppointmentLoaded(getAppointmentDetailsMapper));
    });
    on<TimeClickEvent>((event, emit) async {
      GetAppointmentDetailsMapper getAppointmentDetailsMapper =
          appointmentDetailsMapper.copyWith(selectedTime: event.selectedTime);
      emit(AddAppointmentLoaded(getAppointmentDetailsMapper));
    });
  }
}
