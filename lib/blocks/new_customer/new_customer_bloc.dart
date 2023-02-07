
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pamperbook/data/mapper/new_customer_response_mapper.dart';
import 'package:pamperbook/data/models/request/new_customer/NewCustomerRequest.dart';
import 'package:pamperbook/data/models/response/new_customer/NewCustomerResponse.dart';
import 'package:pamperbook/resources/api_repository.dart';

part 'new_customer_state.dart';
part 'new_customer_event.dart';

class NewCustomerBloc extends Bloc<NewCustomerEvent, NewCustomerState> {
  NewCustomerBloc() : super(NewCustomerInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    NewCustomerResponseMapper newCustomerResponseMapper;

    on<GetNewCustomerResponse>((event, emit) async {

        try {
          emit(NewCustomerLoading());

          newCustomerResponseMapper = NewCustomerResponseMapper(
              0,
              false,
            "",
            true

          );

          try{
            final newCustomerResponse = await _apiRepository.fetchNewCustomerResponse(event.newCustomerRequest);

            newCustomerResponseMapper = NewCustomerResponseMapper(
                newCustomerResponse.code,
                newCustomerResponse.error,
                newCustomerResponse.message,
              false

            );

            emit(NewCustomerLoaded(newCustomerResponse));

          }catch(error,stackTrace){
            emit(const NewCustomerError("Failed to fetch data. is your device online?"));
          }

        } on NetworkError {
          emit(const NewCustomerError("Failed to fetch data. is your device online?"));
        }
      });

  }
}
