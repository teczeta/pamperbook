part of 'verify_email_bloc.dart';

@immutable
abstract class VerifyEmailEvent {}


class VerifyEmailResponseEvent extends VerifyEmailEvent{

  final VerifyEmailRequest verifyEmailRequest;

  VerifyEmailResponseEvent(this.verifyEmailRequest);

}