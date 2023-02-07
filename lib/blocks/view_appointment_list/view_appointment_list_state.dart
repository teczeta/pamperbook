part of 'view_appointment_list_bloc.dart';

abstract class ViewAppointmentListState {
  const ViewAppointmentListState();
  @override
  List<Object> get props => [];
}

class ViewAppointmentListInitial extends ViewAppointmentListState {}



class ViewAppointmentListLoading extends ViewAppointmentListState {}

class ViewAppointmentListLoaded extends ViewAppointmentListState {
  final ViewAppointmentMapper viewAppointmentMapper;
  const ViewAppointmentListLoaded(this.viewAppointmentMapper);
}

class ViewAppointmentListError extends ViewAppointmentListState {
  final String? message;
  const ViewAppointmentListError(this.message);
}
