part of 'get_edit_appointment_details_bloc.dart';

abstract class GetEditAppointmentDetailsEvent {

  const GetEditAppointmentDetailsEvent();

  @override
  List<Object> get props => [];

}


class GetEditAppointmentDetailsResponseEvent extends GetEditAppointmentDetailsEvent{

  final EditAppointmentDetailsRequest editAppointmentDetailsRequest;
  GetEditAppointmentDetailsResponseEvent(this.editAppointmentDetailsRequest);

}
class UpdateAppointmentDetailsResponseEvent extends GetEditAppointmentDetailsEvent{

  final UpdateAppointmentRequest updateAppointmentRequest;
  UpdateAppointmentDetailsResponseEvent(this.updateAppointmentRequest);

}
class DateTimeClickEvent extends GetEditAppointmentDetailsEvent {
  DateTime selectedDate;

  DateTimeClickEvent(this.selectedDate);
}

class TimeClickEvent extends GetEditAppointmentDetailsEvent {
  TimeOfDay selectedTime;

  TimeClickEvent(this.selectedTime);
}
class CancelAppointmentClickEvent extends GetEditAppointmentDetailsEvent{
  final EditAppointmentDetailsRequest editAppointmentDetailsRequest;
  CancelAppointmentClickEvent(this.editAppointmentDetailsRequest);

}