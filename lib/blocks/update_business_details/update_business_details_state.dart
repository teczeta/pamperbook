part of 'update_business_details_bloc.dart';

@immutable
abstract class UpdateBusinessDetailsState {}

class UpdateBusinessDetailsInitial extends UpdateBusinessDetailsState {}
class UpdateBusinessDetailsLoading extends UpdateBusinessDetailsState {}
class UpdateBusinessDetailsLoaded extends UpdateBusinessDetailsState {

  final BusinessDetailsMapper businessDetailsMapper;
  UpdateBusinessDetailsLoaded(this.businessDetailsMapper);

}
class UpdateBusinessDetailsError extends UpdateBusinessDetailsState {

  final String message;
  UpdateBusinessDetailsError(this.message);
}
