import 'package:equatable/equatable.dart';
import 'package:pamperbook/data/models/InitResponse.dart';
import 'package:pamperbook/data/models/login/LoginResponse.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final LoginResponse loginResponse;
  const LoginLoaded(this.loginResponse);
}

class LoginError extends LoginState {
  final String? message;
  const LoginError(this.message);
}
