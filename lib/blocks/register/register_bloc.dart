import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pamperbook/data/mapper/register_mapper.dart';
import 'package:pamperbook/data/models/request/register/RegisterRequest.dart';
import 'package:pamperbook/data/models/response/register/RegisterResponse.dart';

import '../../resources/api_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {

    final ApiRepository _apiRepository = ApiRepository();

    RegisterMapper registerMapper = RegisterMapper().copyWith(
      code: 0,error: false,message: "",showLoader: false,initialCountryValue: "Country"
    );
    emit(RegisterLoaded(registerMapper));

    on<RegisterResponseEvent>((event, emit) async {
      try{
        emit(RegisterLoading());
        try{


          final RegisterResponse registerResponse = await _apiRepository.fetchRegisterResponse(event.registerRequest);

          RegisterMapper registerMapper =  RegisterMapper().copyWith(
            code: registerResponse.code,
              message: registerResponse.message,showLoader: false
          );

          if(!registerResponse.error!){
            emit(RegisterLoaded(registerMapper));
          }else{
            RegisterMapper registerMapper =  RegisterMapper().copyWith(
                message: registerResponse.message
            );
            emit(RegisterLoaded(registerMapper));
          }
        }catch(error, stackTrace){
          emit(RegisterError("Failed to fetch data. is your device online?"));

        }
      }catch(error,stackTrace){
        emit(RegisterError("Failed to fetch data. is your device online?"));
      }


    });


    on<CountryClickEvent>((event, emit) async {

          RegisterMapper registerMapper =  RegisterMapper().copyWith(
             initialCountryValue: event.country,message: ""
          );

          emit(RegisterLoaded(registerMapper));

    });
  }
}
