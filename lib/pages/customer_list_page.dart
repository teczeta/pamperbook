import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pamperbook/blocks/customer_list/customer_list_bloc.dart';
import 'package:pamperbook/blocks/customer_list/customer_list_event.dart';
import 'package:pamperbook/blocks/customer_list/customer_list_state.dart';
import 'package:pamperbook/constants.dart';
import 'package:pamperbook/data/models/request/customers_list/CustomerListRequest.dart';

class CustomerListPage extends StatefulWidget {
  const CustomerListPage({Key? key}) : super(key: key);

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {

  final CustomerListBloc _customerListBloc = CustomerListBloc();

  @override
  void initState() {
    var customerListRequest = CustomerListRequest();
    customerListRequest.action = "customerList";
    customerListRequest.data = Data();
    _customerListBloc.add(CusListResponse(customerListRequest));
    super.initState();
  }

  List<String> litems = ["Liam Mitchell", "Test 1", "Test 2", "Test 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text("View Customers",
            style: TextStyle(color: textColorBlack)),
        backgroundColor: primaryColor,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: BlocProvider(
          create: (context) => _customerListBloc,
          child: BlocBuilder<CustomerListBloc, CustomerListState>(
            builder: (context, state) {
              if (state is CustomerListLoading) {
                return _buildLoading();
              } else if (state is CustomerListLoaded) {
                var list = state.customerListResponse.data!.customers;
                return ListView.separated(
                    itemCount: state.customerListResponse.data!.customers!
                        .length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                          height: 1, thickness: 0.1, color: textColorBlack,),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(

                        leading: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: textColorBlack,),
                        title: Text(list![index].name!),
                      );
                    });
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

Widget _buildLoading() => Center(child: CircularProgressIndicator());
