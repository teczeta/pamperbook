import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pamperbook/data/models/request/get_edit_appointment_details/EditAppointmentDetailsRequest.dart';
import 'package:pamperbook/data/models/request/update_edit_appointment/UpdateAppointmentRequest.dart';
import 'package:pamperbook/data/models/response/get_edit_appointment_details/EditAppointmentDetailsResponse.dart';

import '../../resources/api_repository.dart';

part 'get_edit_appointment_details_event.dart';
part 'get_edit_appointment_details_state.dart';

class GetEditAppointmentDetailsBloc extends Bloc<GetEditAppointmentDetailsEvent, GetEditAppointmentDetailsState> {
  GetEditAppointmentDetailsBloc() : super(GetEditAppointmentDetailsInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    EditAppointmentDetailsResponse? editAppointmentDetailsResponse = null;
    on<GetEditAppointmentDetailsResponseEvent>((event, emit) async {
      try {
        emit(GetEditAppointmentDetailsLoading());
        try{
          editAppointmentDetailsResponse = await _apiRepository.fetchEditAppointmentDetailsResponse(event.editAppointmentDetailsRequest);

          String? time = editAppointmentDetailsResponse!.data!.time;

          TimeOfDay timeNew = TimeOfDay(hour: int.parse(time!.split(":")[0]), minute: int.parse(time!.split(":")[1]));
          DateTime dateNew = DateTime.parse('${editAppointmentDetailsResponse!.data!.date} 00:00:00.000');

          editAppointmentDetailsResponse!.selectedDate = dateNew;
          editAppointmentDetailsResponse!.selectedTime = timeNew;
         // EditAppointmentDetailsResponse response=  editAppointmentDetailsResponse!.copyWith(selectedDate:dateNew,selectedTime: timeNew);
          emit(GetEditAppointmentDetailsLoaded(editAppointmentDetailsResponse!));

        }catch(error,stackTrace){
          emit( GetEditAppointmentDetailsError("Failed to fetch data. is your device online?"));
        }

      } on NetworkError {
        emit( GetEditAppointmentDetailsError("Failed to fetch data. is your device online?"));
      }
    });
    on<CancelAppointmentClickEvent>((event, emit) async {
      try {
        emit(GetEditAppointmentDetailsLoading());
        try{
          editAppointmentDetailsResponse = await _apiRepository.fetchEditAppointmentDetailsResponse(event.editAppointmentDetailsRequest);

          emit(GetCancelAppointmentDetailsLoaded(editAppointmentDetailsResponse!));

        }catch(error,stackTrace){
          emit( GetEditAppointmentDetailsError("Failed to fetch data. is your device online?"));
        }

      } on NetworkError {
        emit( GetEditAppointmentDetailsError("Failed to fetch data. is your device online?"));
      }
    });
    on<UpdateAppointmentDetailsResponseEvent>((event, emit) async {
      try {
        emit(GetEditAppointmentDetailsLoading());
        try{
          final customerListResponse = await _apiRepository.fetchUpdateAppointmentDetailsResponse(event.updateAppointmentRequest);

          if(!customerListResponse.error!){
            EditAppointmentDetailsResponse response = editAppointmentDetailsResponse!.copyWith(showLoader: true);
            emit(GetEditAppointmentDetailsLoaded(response));

          }else{
            emit( GetEditAppointmentDetailsError(customerListResponse.message));

          }

        }catch(error,stackTrace){
          emit( GetEditAppointmentDetailsError("Failed to fetch data. is your device online?"));
        }

      } on NetworkError {
        emit( GetEditAppointmentDetailsError("Failed to fetch data. is your device online?"));
      }
    });

    on<DateTimeClickEvent>((event, emit) async {
      editAppointmentDetailsResponse!.selectedDate = event.selectedDate;
      EditAppointmentDetailsResponse response = editAppointmentDetailsResponse!.copyWith(selectedDate: event.selectedDate);
      emit(GetEditAppointmentDetailsLoaded(response));
    });
    on<TimeClickEvent>((event, emit) async {
      editAppointmentDetailsResponse!.selectedTime = event.selectedTime;

      EditAppointmentDetailsResponse response = editAppointmentDetailsResponse!.copyWith(selectedTime: event.selectedTime);
      emit(GetEditAppointmentDetailsLoaded(response));
    });
  }
}
