
import 'package:bloc/bloc.dart';
import 'package:pamperbook/resources/api_repository.dart';

import 'customer_list_event.dart';
import 'customer_list_state.dart';



class CustomerListBloc extends Bloc<CustomerListEvent, CustomerListState> {
  CustomerListBloc() : super(CustomerListInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<CusListResponse>((event, emit) async {
      try {
        emit(CustomerListLoading());
        try{
          final customerListResponse = await _apiRepository.fetchCustomerListResponse(event.customerListRequest);
          emit(CustomerListLoaded(customerListResponse));

        }catch(error,stackTrace){
          emit(const CustomerListError("Failed to fetch data. is your device online?"));
        }

      } on NetworkError {
        emit(const CustomerListError("Failed to fetch data. is your device online?"));
      }
    });
  }
}


