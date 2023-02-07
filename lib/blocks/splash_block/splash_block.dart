import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pamperbook/blocks/splash_block/splash_event.dart';
import 'package:pamperbook/blocks/splash_block/splash_state.dart';
import 'package:pamperbook/resources/api_repository.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetInitResponse>((event, emit) async {
      try {
        emit(SplashLoading());
        try{
          final initResponse = await _apiRepository.fetchInitResponse(event.initRequest);
          emit(InitLoaded(initResponse));

        }catch(error,stackTrace){
          emit(const SplashError("Failed to fetch data. is your device online?"));
        }

      } on NetworkError {
        emit(const SplashError("Failed to fetch data. is your device online?"));
      }
    });
  }
}