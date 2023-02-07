import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pamperbook/data/mapper/register_mapper.dart';
import 'package:pamperbook/data/models/request/verifyEmail/VerifyEmailRequest.dart';
import 'package:pamperbook/data/models/response/verifyEmail/VerifyEmailResponse.dart';

import '../../resources/api_repository.dart';

part 'verify_email_event.dart';
part 'verify_email_state.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  final ApiRepository _apiRepository = ApiRepository();
  VerifyEmailBloc() : super(VerifyEmailInitial()) {

    RegisterMapper registerMapper = RegisterMapper().copyWith(
        code: 0,message: "",
        showLoader: false
    );
    emit(VerifyEmailLoaded(registerMapper));

    on<VerifyEmailResponseEvent>((event, emit) async {

      try{


        try{

          final VerifyEmailResponse verifyEmailResponse = await _apiRepository.fetchVerifyEmailResponse(event.verifyEmailRequest);

          RegisterMapper registerMapper = RegisterMapper().copyWith(
            code: verifyEmailResponse.code,message: verifyEmailResponse.message,
            showLoader: false,initialCountryValue: verifyEmailResponse.data!.token
          );

          emit(VerifyEmailLoaded(registerMapper));

        }catch(error,stackTrace){
          emit(VerifyEmailError("Failed to fetch data. is your device online?"));
        }

      }on NetworkError {
        emit(VerifyEmailError("Failed to fetch data. is your device online?"));
      }


    });
  }
}
