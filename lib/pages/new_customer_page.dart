import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pamperbook/blocks/new_customer/new_customer_bloc.dart';
import 'package:pamperbook/data/models/request/new_customer/NewCustomerRequest.dart';
import 'package:pamperbook/pages/customer_list_page.dart';
import 'package:pamperbook/widgets/custom_elevated_button.dart';

import '../constants.dart';

class NewCustomerPage extends StatefulWidget {
  const NewCustomerPage({Key? key}) : super(key: key);

  @override
  State<NewCustomerPage> createState() => _NewCustomerPageState();
}

class _NewCustomerPageState extends State<NewCustomerPage> {
  final NewCustomerBloc _newCustomerBloc = NewCustomerBloc();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text("New Customer",
              style: TextStyle(color: textColorBlack)),
          backgroundColor: primaryColor,
        ),
        body: BlocProvider(
          create: (context) => _newCustomerBloc,
          child: BlocListener<NewCustomerBloc, NewCustomerState>(
            listener: (context, state) {

              if(state is NewCustomerLoaded){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const CustomerListPage(),
                  ),
                );
              }
            },
            child: BlocBuilder<NewCustomerBloc, NewCustomerState>(
              builder: (context, state) {
                if (state is NewCustomerLoading) {
                  return Center(child: const CircularProgressIndicator());
                } else if (state is NewCustomerInitial) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        _labelWithTextField("First Name*", "Enter First Name",
                            _firstNameController),
                        _labelWithTextField("Last Name*", "Enter Last Name",
                            _lastNameController),
                        Container(
                            margin: const EdgeInsets.only(top: 20, left: 20),
                            child: const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Appointment Reminder",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: textColorBlack,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.only(top: 5, left: 20),
                            child: const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "IMPORTANT:To appointment reminders please provide a valid mobile or email below",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: textColorBlack, fontSize: 12),
                              ),
                            )),
                        _labelWithTextField("Mobile Number",
                            "Enter Mobile Number", _mobileController),
                        _labelWithTextField(
                            "Email", "Enter Email Address", _emailController),
                        _labelWithTextField("Note", "Typing", _noteController),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: CustomElevatedButton(
                                onButtonClicked: () {
                                  NewCustomerRequest newCustomerRequest =
                                  NewCustomerRequest();
                                  newCustomerRequest.action = "addCustomer";

                                  var newCustomerData = Data();
                                  newCustomerData.firstName =
                                      _firstNameController.text;
                                  newCustomerData.lastName =
                                      _lastNameController.text;
                                  newCustomerData.email = _emailController.text;
                                  newCustomerData.phone =
                                      _mobileController.text;
                                  newCustomerData.note = _noteController.text;

                                  newCustomerRequest.data = newCustomerData;

                                  _newCustomerBloc.add(GetNewCustomerResponse(
                                      newCustomerRequest));


/*

*/
                                },
                                buttonText: "Add Customer"))
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ));
  }

  Widget _labelWithTextField(String labelText, String hintText,
      TextEditingController textEditingController) {
    int textFieldHeight = 1;
    if (labelText == "Note") {
      textFieldHeight = 10;
    }

    return Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10, left: 2),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  labelText,
                  style: const TextStyle(
                      color: textColorBlack,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TextField(
              cursorHeight: 15,
              controller: textEditingController,
              textAlign: TextAlign.start,
              maxLines: textFieldHeight,
              minLines: null,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: textColorUnknown, width: 0.0)),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: textColorUnknown, width: 0.0),
                  ),
                  hintText: hintText),
            ),
          ],
        ));
  }
}
