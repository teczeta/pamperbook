
import 'package:equatable/equatable.dart';
import 'package:pamperbook/data/models/response/customers_list/CustomerListResponse.dart';

abstract class CustomerListState extends Equatable {
  const CustomerListState();

  @override
  List<Object?> get props => [];
}

class CustomerListInitial extends CustomerListState {}
class CustomerListLoading extends CustomerListState {}
class CustomerListLoaded extends CustomerListState {
  final CustomerListResponse customerListResponse;
  const CustomerListLoaded(this.customerListResponse);
}
class CustomerListError extends CustomerListState {
  final String? message;
  const CustomerListError(this.message);
}




