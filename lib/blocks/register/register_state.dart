part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterLoaded extends RegisterState {

 final  RegisterMapper registerMapper;
 RegisterLoaded(this.registerMapper);
}
class RegisterError extends RegisterState {

  final String message;
  RegisterError(this.message);

}
