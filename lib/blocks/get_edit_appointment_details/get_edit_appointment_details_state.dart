part of 'get_edit_appointment_details_bloc.dart';

abstract class GetEditAppointmentDetailsState {

}

class GetEditAppointmentDetailsInitial extends GetEditAppointmentDetailsState {}
class GetEditAppointmentDetailsLoading extends GetEditAppointmentDetailsState {}
class GetEditAppointmentDetailsLoaded extends GetEditAppointmentDetailsState {

  final EditAppointmentDetailsResponse editAppointmentDetailsResponse;
  GetEditAppointmentDetailsLoaded(this.editAppointmentDetailsResponse);
}
class GetCancelAppointmentDetailsLoaded extends GetEditAppointmentDetailsState {

  final EditAppointmentDetailsResponse editAppointmentDetailsResponse;
  GetCancelAppointmentDetailsLoaded(this.editAppointmentDetailsResponse);
}
class GetEditAppointmentDetailsError extends GetEditAppointmentDetailsState {
  final String? message;
   GetEditAppointmentDetailsError(this.message);
}