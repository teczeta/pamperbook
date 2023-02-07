import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pamperbook/data/models/request/dash_board/DashBoardRequest.dart';
import 'package:pamperbook/data/models/response/dash_board/DashBoardResponse.dart';
import 'package:pamperbook/resources/api_repository.dart';

part 'dash_board_event.dart';
part 'dash_board_state.dart';

class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  DashBoardBloc() : super(DashBoardInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetDashBoardResponse>((event, emit) async {
      try{
        emit(DashBoardLoading());
        try{
          final dashBoardResponse = await _apiRepository.fetchDashBoardResponse(event.dashBoardRequest);
          emit(DashBoardLoaded(dashBoardResponse));

        }catch(error,stackTrace){
          emit(const DashBoardError("Failed to fetch data. is your device online?"));
        }
      } on NetworkError {
        emit(const DashBoardError("Failed to fetch data. is your device online?"));
      }
      }
    );
  }
}


