part of 'add_appointment_bloc.dart';

abstract class AddAppointmentEvent extends Equatable {
  const AddAppointmentEvent();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AddAppointmentResponse extends AddAppointmentEvent {
  const AddAppointmentResponse();
}

class CustomerClickEvent extends AddAppointmentEvent {
  Customer customer;

  CustomerClickEvent(this.customer);
}

class StaffClickEvent extends AddAppointmentEvent {
  Staff staff;

  StaffClickEvent(this.staff);
}

class ServiceClickEvent extends AddAppointmentEvent {
  Service service;

  ServiceClickEvent(this.service);
}

class DateTimeClickEvent extends AddAppointmentEvent {
  DateTime selectedDate;

  DateTimeClickEvent(this.selectedDate);
}

class TimeClickEvent extends AddAppointmentEvent {
  TimeOfDay selectedTime;

  TimeClickEvent(this.selectedTime);
}

class GetAppointmentDetailsResponseEvent extends AddAppointmentEvent {
  final GetAppointmentDetailsRequest getAppointmentDetailsRequest;

  const GetAppointmentDetailsResponseEvent(this.getAppointmentDetailsRequest);
}
class NewAppointmentResponseEvent extends AddAppointmentEvent {
  final NewAppointmentRequest newAppointmentRequest;

  const NewAppointmentResponseEvent(this.newAppointmentRequest);
}
