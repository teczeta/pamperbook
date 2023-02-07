part of 'dash_board_bloc.dart';

@immutable
abstract class DashBoardEvent extends Equatable{
 const DashBoardEvent();
  @override
  List<Object> get props => [];
}

class GetDashBoardResponse extends DashBoardEvent{

  final DashBoardRequest dashBoardRequest;
  const GetDashBoardResponse(this.dashBoardRequest);

}



