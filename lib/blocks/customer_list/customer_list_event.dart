

import 'package:equatable/equatable.dart';
import 'package:pamperbook/data/models/request/customers_list/CustomerListRequest.dart';

abstract class CustomerListEvent extends Equatable{
  const CustomerListEvent();

  @override
  List<Object> get props => [];

}

class CusListResponse extends CustomerListEvent{

  final CustomerListRequest customerListRequest;
  const CusListResponse(this.customerListRequest);

}

