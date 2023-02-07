import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pamperbook/blocks/login/login_event.dart';
import 'package:pamperbook/blocks/login/login_state.dart';
import 'package:pamperbook/blocks/splash_block/splash_event.dart';
import 'package:pamperbook/blocks/splash_block/splash_state.dart';
import 'package:pamperbook/resources/api_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetLoginResponse>((event, emit) async {
      try {
        emit(LoginLoading());
        try{
          final loginResponse = await _apiRepository.fetchLoginResponse(event.loginRequest);
          emit(LoginLoaded(loginResponse));

        }catch(error,stackTrace){
          emit(const LoginError("Failed to fetch data. is your device online?"));
        }

      } on NetworkError {
        emit(const LoginError("Failed to fetch data. is your device online?"));
      }
    });
  }
}