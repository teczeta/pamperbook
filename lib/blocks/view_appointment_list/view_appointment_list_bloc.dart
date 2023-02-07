import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pamperbook/data/mapper/view_appointment_mapper.dart';
import 'package:pamperbook/data/models/request/view_appoitment/ViewAppointmentListRequest.dart';
import 'package:pamperbook/data/models/response/view_appoitment/ViewAppoitmentListResponse.dart';
import 'package:pamperbook/resources/api_repository.dart';

part 'view_appointment_list_event.dart';

part 'view_appointment_list_state.dart';

class ViewAppointmentListBloc
    extends Bloc<ViewAppointmentListEvent, ViewAppointmentListState> {
  ViewAppointmentListBloc() : super(ViewAppointmentListInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    ViewAppointmentMapper appointmentMapper = ViewAppointmentMapper();
    List<String> litems = ["All"];
    List<Filters> listFilterItems = [];
    List<Appointment> listAppointmentNew = [];

    on<GetViewAppointmentListResponse>((event, emit) async {
      try {
        emit(ViewAppointmentListLoading());
        try {
          final viewAppointmentListResponse = await _apiRepository
              .fetchAppointmentListResponse(event.viewAppoitmentListRequest);


          List<Filters> listFilterItems = [];
          var listAppointments= viewAppointmentListResponse.data!.appointments!;

          for(Appointments filterItem in viewAppointmentListResponse.data!.appointments!){

            if(!litems.contains(filterItem.status)){
              litems.add(filterItem.status!);
            }
          }


          for(var items in litems){

            if(items == "All"){
              Filters filters = Filters(isSelected: true,item: items);
              listFilterItems.add(filters);
            }else{
              Filters filters = Filters(isSelected: false,item: items);
              listFilterItems.add(filters);

            }

          }

          for (var appointments in listAppointments!) {
            Appointment appointment = Appointment(id: appointments.id, appointmentTime: appointments.appointmentTime,

              serviceName: appointments.serviceName,status: appointments.status,customerName: appointments.customerName
            );
            listAppointmentNew.add(appointment);
          }

          appointmentMapper.customer =listAppointmentNew;
          appointmentMapper.filters =listFilterItems;


          emit(ViewAppointmentListLoaded(appointmentMapper));
        } catch (error, stackTrace) {
          emit(const ViewAppointmentListError(
              "Failed to fetch data. is your device online?"));
        }
      } on NetworkError {
        emit(const ViewAppointmentListError(
            "Failed to fetch data. is your device online?"));
      }
    });

    on<FilterItemClickEvent>((event, emit) async {

      String itemSelected = event.item!;
      listFilterItems.clear();
      //listAppointmentNew.clear();
      List<Appointment> listAppointmentUpdated = [];

      

      for(var items in appointmentMapper.filters!){
        if(items.item == itemSelected){
          Filters filters = Filters(isSelected: true,item: items.item);
          listFilterItems.add(filters);
        }else{
          Filters filters = Filters(isSelected: false,item: items.item);
          listFilterItems.add(filters);

        }

      }

      if(itemSelected == "All")
        listAppointmentUpdated = appointmentMapper.customer!;
        else listAppointmentUpdated =  appointmentMapper.customer!.where((element) => element.status!.toLowerCase() == itemSelected.toLowerCase()).toList();



      ViewAppointmentMapper getAppointmentDetailsMapper =
      appointmentMapper.copyWith(filters: listFilterItems,customer: listAppointmentUpdated);
      emit(ViewAppointmentListLoaded(getAppointmentDetailsMapper));
    });
  }
}

