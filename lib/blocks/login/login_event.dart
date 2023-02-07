import 'package:equatable/equatable.dart';
import 'package:pamperbook/data/models/InitRequest.dart';
import 'package:pamperbook/data/models/request/login/LoginRequest.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class GetLoginResponse extends LoginEvent {

  final LoginRequest loginRequest;

  const GetLoginResponse(this.loginRequest);

}


