part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}


class RegisterResponseEvent extends RegisterEvent{

  final RegisterRequest registerRequest;

  RegisterResponseEvent(this.registerRequest);
}
class CountryClickEvent extends RegisterEvent{

  final String country;

  CountryClickEvent(this.country);
}