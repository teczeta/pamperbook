part of 'new_customer_bloc.dart';

abstract class NewCustomerState extends Equatable {
  const NewCustomerState();
  @override
  List<Object> get props => [];
}

class NewCustomerInitial extends NewCustomerState {

}

class NewCustomerLoading extends NewCustomerState {}

class NewCustomerLoaded extends NewCustomerState {
  final NewCustomerResponse newCustomerResponse;


  const NewCustomerLoaded(this.newCustomerResponse);
}

class NewCustomerError extends NewCustomerState {
  final String? message;
  const NewCustomerError(this.message);
}
