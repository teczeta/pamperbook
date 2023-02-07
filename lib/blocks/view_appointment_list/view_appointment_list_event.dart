part of 'view_appointment_list_bloc.dart';

abstract class ViewAppointmentListEvent  {
  const ViewAppointmentListEvent();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class GetViewAppointmentListResponse extends ViewAppointmentListEvent {

  final ViewAppointmentListRequest viewAppoitmentListRequest;

  const GetViewAppointmentListResponse(this.viewAppoitmentListRequest);


}

class FilterItemClickEvent extends ViewAppointmentListEvent {
  final String? item;

  const FilterItemClickEvent(this.item);
}