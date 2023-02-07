part of 'verify_email_bloc.dart';

@immutable
abstract class VerifyEmailState {}

class VerifyEmailInitial extends VerifyEmailState {}

class VerifyEmailLoading extends VerifyEmailState{}
class VerifyEmailLoaded extends VerifyEmailState{

  final RegisterMapper registerMapper;
  VerifyEmailLoaded(this.registerMapper);

}
class VerifyEmailError extends VerifyEmailState{

  String message;
  VerifyEmailError(this.message);
}