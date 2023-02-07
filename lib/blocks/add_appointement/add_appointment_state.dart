part of 'add_appointment_bloc.dart';

abstract class AddAppointmentState {
  const AddAppointmentState();
  @override
  List<Object> get props => [];
}

class AddAppointmentInitial extends AddAppointmentState {
  const AddAppointmentInitial();
}

class AddAppointmentLoading extends AddAppointmentState {}
class AddAppointmentLoaded extends AddAppointmentState {
  final GetAppointmentDetailsMapper getAppointmentDetailsResponse;
  const AddAppointmentLoaded(this.getAppointmentDetailsResponse);
}
class AddAppointmentLoadedError extends AddAppointmentState {
  final String? message;
  const AddAppointmentLoadedError(this.message);
}

