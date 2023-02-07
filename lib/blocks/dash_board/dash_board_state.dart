part of 'dash_board_bloc.dart';

@immutable
abstract class DashBoardState extends Equatable {
  const DashBoardState();

  @override
  List<Object?> get props => [];
}

class DashBoardInitial extends DashBoardState {}
class DashBoardLoading extends DashBoardState {}
class DashBoardLoaded extends DashBoardState {
  final DashBoardResponse dashBoardResponse;
  const DashBoardLoaded(this.dashBoardResponse);

}
class DashBoardError extends DashBoardState {

  final String? message;

  const DashBoardError(this.message);

}
