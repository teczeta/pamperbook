import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pamperbook/data/mapper/business_details_mapper.dart';
import 'package:pamperbook/data/models/request/update_business_details/UpdateBusinessDetailsRequest.dart';

import '../../resources/api_repository.dart';

part 'update_business_details_event.dart';
part 'update_business_details_state.dart';

class UpdateBusinessDetailsBloc extends Bloc<UpdateBusinessDetailsEvent, UpdateBusinessDetailsState> {
  UpdateBusinessDetailsBloc() : super(UpdateBusinessDetailsInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    BusinessDetailsMapper businessDetailsMapper = BusinessDetailsMapper().copyWith(
        code: 0,
        error: false,
        message: "",
        initialValue: "Select Type",
        showLoader: false

    );


    emit(UpdateBusinessDetailsLoaded(businessDetailsMapper));

    on<UpdateBusinessDetailsResponseEvent>((event, emit) async {

      try {

        emit(UpdateBusinessDetailsLoading());
        try{
          final customerListResponse = await _apiRepository.fetchUpdateBusinessDetailsResponse(event.updateBusinessDetailsRequest);
          BusinessDetailsMapper businessDetailsMapper;
          if(!customerListResponse.error!){
            businessDetailsMapper = BusinessDetailsMapper().copyWith(
                code: customerListResponse.code,
                error: customerListResponse.error,
                message: customerListResponse.message,
                showLoader: false

            );
          }else{
             businessDetailsMapper = BusinessDetailsMapper().copyWith(
                code: customerListResponse.code,
                error: customerListResponse.error,
                message: customerListResponse.message,
                showLoader: false

            );

          }


          emit(UpdateBusinessDetailsLoaded(businessDetailsMapper));

        }catch(error,stackTrace){
          emit(UpdateBusinessDetailsError("Failed to fetch data. is your device online?"));
        }

      } on NetworkError {
        emit(UpdateBusinessDetailsError("Failed to fetch data. is your device online?"));
      }


    }

    );

    on<OnClickBusinessTypeEvent>((event, emit) async {

      BusinessDetailsMapper businessDetailsMapper = BusinessDetailsMapper().copyWith(
          code: 0,
          error: false,
          message: "",
          showLoader: false,
        initialValue: event.businessType

      );

      emit(UpdateBusinessDetailsLoaded(businessDetailsMapper));


    } );
  }
}
