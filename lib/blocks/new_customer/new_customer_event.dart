part of 'new_customer_bloc.dart';

abstract class NewCustomerEvent extends Equatable {
  const NewCustomerEvent();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class GetNewCustomerResponse extends NewCustomerEvent {

  final NewCustomerRequest newCustomerRequest;

  const GetNewCustomerResponse(this.newCustomerRequest);


}