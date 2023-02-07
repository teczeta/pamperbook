part of 'update_business_details_bloc.dart';

@immutable
abstract class UpdateBusinessDetailsEvent {}

class UpdateBusinessDetailsResponseEvent extends UpdateBusinessDetailsEvent{

  final UpdateBusinessDetailsRequest updateBusinessDetailsRequest;
  UpdateBusinessDetailsResponseEvent(this.updateBusinessDetailsRequest);
}

class OnClickBusinessTypeEvent extends UpdateBusinessDetailsEvent{

  final String businessType;
  OnClickBusinessTypeEvent(this.businessType);
}
