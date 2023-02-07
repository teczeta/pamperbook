import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pamperbook/blocks/add_appointement/add_appointment_bloc.dart';
import 'package:pamperbook/data/mapper/get_appointment_details_mapper.dart';
import 'package:pamperbook/data/models/request/get_appointment_details/GetAppointmentDetailsRequest.dart';
import 'package:pamperbook/pages/new_customer_page.dart';
import 'package:pamperbook/widgets/custom_elevated_button.dart';
import 'package:pamperbook/widgets/custom_elevated_button_rectangle.dart';
import 'package:pamperbook/widgets/drop_down_widget.dart';

import '../constants.dart';
import '../data/models/request/new_appointment/NewAppointmentRequest.dart';

class NewAppointmentPage extends StatefulWidget {
  const NewAppointmentPage({Key? key}) : super(key: key);

  @override
  State<NewAppointmentPage> createState() => _NewAppointmentPageState();
}

class _NewAppointmentPageState extends State<NewAppointmentPage> {
  final AddAppointmentBloc _addAppointmentBloc = AddAppointmentBloc();
  TextEditingController houseNoController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController postalController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  GetAppointmentDetailsRequest getAppointmentDetailsRequest =
      GetAppointmentDetailsRequest();

  @override
  void initState() {
    getAppointmentDetailsRequest.action = "getDetailsForNewAppointment";
    getAppointmentDetailsRequest.data = Data();
    _addAppointmentBloc
        .add(GetAppointmentDetailsResponseEvent(getAppointmentDetailsRequest));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text("New Appointment",
            style: TextStyle(color: textColorUnknown)),
        backgroundColor: primaryColor,
      ),
      body: BlocProvider(
        create: (context) => _addAppointmentBloc,
        child: BlocListener<AddAppointmentBloc, AddAppointmentState>(
          listener: (context, state) {
            if (state is AddAppointmentLoaded) {
              if (state.getAppointmentDetailsResponse.showLoader!) {
                Future.delayed(Duration.zero, () async {
                  showAlertDialogCommon(
                      context, "Appointment is registered successfully...", () {
                    houseNoController.text = "";
                    streetController.text = "";
                    townController.text = "";
                    postalController.text = "";
                    noteController.text = "";

                    _addAppointmentBloc.add(GetAppointmentDetailsResponseEvent(
                        getAppointmentDetailsRequest));
                  });
                });
              }
            }
          },
          child: BlocBuilder<AddAppointmentBloc, AddAppointmentState>(
            builder: (context, state) {
              if (state is AddAppointmentLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is AddAppointmentLoaded) {
                print(state.getAppointmentDetailsResponse.customer);
                return Container(
                    margin: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    showAlertDialog(
                                        context,
                                        state.getAppointmentDetailsResponse
                                            .customer,
                                        "Customer List");
                                  },
                                  child: dropDownWidget(
                                      state.getAppointmentDetailsResponse
                                          .initialCustomerValue!.name!,
                                      Icons.keyboard_arrow_down),
                                ),
                              ),
                              Expanded(
                                  child: CustomElevatedButtonRectangle(
                                      onButtonClicked: () {
                                        Navigator.of(context,
                                                rootNavigator: false)
                                            .push(
                                          MaterialPageRoute(
                                            builder: (_) => NewCustomerPage(),
                                          ),
                                        );
                                      },
                                      buttonText: "Add Customer"))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _selectDate(
                                        context,
                                        state.getAppointmentDetailsResponse
                                            .selectedDate);
                                  },
                                  child: dropDownWidget(
                                      "${state.getAppointmentDetailsResponse.selectedDate}"
                                          .split(' ')[0],
                                      Icons.calendar_today_outlined),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                    onTap: () {
                                      displayTimePicker(context);
                                    },
                                    child: dropDownWidget(
                                        TimeOfDay(
                                                hour: state
                                                    .getAppointmentDetailsResponse
                                                    .selectedTime!
                                                    .hour!,
                                                minute: state
                                                    .getAppointmentDetailsResponse
                                                    .selectedTime!
                                                    .minute)
                                            .format(context),
                                        Icons.timer)),
                              ),
                            ],
                          ),
                          GestureDetector(
                              onTap: () {
                                showAlertDialogStaff(
                                    context,
                                    state.getAppointmentDetailsResponse.staffs,
                                    "Staff List");
                              },
                              child: dropDownWidget(
                                  state.getAppointmentDetailsResponse
                                      .initialStaffValue!.name!,
                                  Icons.person)),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 10),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text("Location:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: textColorUnknown)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 10),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  "For this appointment slot,staff will be visiting customer at a location of your choice:",
                                  style: TextStyle(
                                      fontSize: 14, color: textColorUnknown)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: _labelWithTextField(
                                    "House No", houseNoController),
                                flex: 1,
                              ),
                              Expanded(
                                child: _labelWithTextField(
                                    "Street", streetController),
                                flex: 2,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: _labelWithTextField(
                                    "Town/City", townController),
                              ),
                              Expanded(
                                  child: _labelWithTextField(
                                      "Post Code", postalController))
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              showAlertDialogService(
                                  context,
                                  state.getAppointmentDetailsResponse.service,
                                  "Service List");
                            },
                            child: dropDownWidget(
                                state.getAppointmentDetailsResponse
                                    .initialServiceValue!.name!,
                                Icons.keyboard_arrow_down),
                          ),
                          _labelWithTextField("Notes", noteController),
                          Container(
                              width: double.infinity,
                              height: 40,
                              margin: EdgeInsets.all(20),
                              child: CustomElevatedButton(
                                  onButtonClicked: () {
                                    var stateResponse =
                                        state.getAppointmentDetailsResponse;
                                    if (stateResponse
                                            .initialCustomerValue!.name ==
                                        "Select Customer") {
                                      print(stateResponse
                                          .initialCustomerValue!.name);
                                      showAlertDialogCommon(context,
                                          "All Fields are Mandatory", () {});
                                    } else if (stateResponse
                                            .initialStaffValue!.name ==
                                        "Select Staff") {
                                      print(stateResponse
                                          .initialStaffValue!.name);
                                      showAlertDialogCommon(context,
                                          "All Fields are Mandatory", () {});
                                    } else if (stateResponse
                                            .initialServiceValue!.name ==
                                        "Select Service") {
                                      print(stateResponse
                                          .initialServiceValue!.name);
                                      showAlertDialogCommon(context,
                                          "All Fields are Mandatory", () {});
                                    } else if (houseNoController.text.isEmpty ||
                                        streetController.text.isEmpty ||
                                        townController.text.isEmpty ||
                                        postalController.text.isEmpty) {
                                      showAlertDialogCommon(context,
                                          "All Fields are Mandatory", () {});
                                    } else {
                                      NewAppointmentRequest request =
                                          new NewAppointmentRequest();
                                      request.action = "addAppointment";

                                      DataNewAppointment dataNew =
                                          DataNewAppointment();
                                      dataNew.time =
                                          "${state.getAppointmentDetailsResponse.selectedTime!.hour}:${state.getAppointmentDetailsResponse.selectedTime!.minute}";
                                      dataNew.customerId = stateResponse
                                          .initialCustomerValue!.id;
                                      dataNew.staffId =
                                          stateResponse.initialStaffValue!.id;
                                      dataNew.serviceId =
                                          stateResponse.initialServiceValue!.id;
                                      dataNew.houseNo = houseNoController.text;
                                      dataNew.street = streetController.text;
                                      dataNew.townCity = townController.text;
                                      dataNew.postCode = postalController.text;
                                      dataNew.duration = stateResponse
                                          .initialServiceValue!.duration;
                                      dataNew.notes = noteController.text;
                                      dataNew.date =
                                          "${state.getAppointmentDetailsResponse.selectedDate}"
                                              .split(' ')[0];

                                      dataNew.price = stateResponse
                                          .initialServiceValue!.price;

                                      request.data = dataNew;

                                      _addAppointmentBloc.add(
                                          NewAppointmentResponseEvent(request));
                                    }
                                  },
                                  buttonText: "Create Appointment")),
                        ],
                      ),
                    ));
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  onButtonClicked() {}

  Future<void> _selectDate(BuildContext context, DateTime? selectedDate) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime.now()!,
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      _addAppointmentBloc.add(DateTimeClickEvent(picked));
    }
  }

  Future displayTimePicker(BuildContext context) async {
    var time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (time != null) {
      _addAppointmentBloc.add(TimeClickEvent(time));
    }
  }

  Widget _labelWithTextField(
      String hintText, TextEditingController textEditingController) {
    double minLines = 1;

    if (hintText == "Notes") {
      minLines = 10;
    }

    return Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 5),
        child: Column(
          children: [
            TextField(
              cursorHeight: 15,
              maxLines: null,
              minLines: minLines.toInt(),
              controller: textEditingController,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: textColorUnknown, width: 0.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: textColorUnknown, width: 0.0),
                  ),
                  hintText: hintText),
            ),
          ],
        ));
  }

  void addAnotherServiceClicked() {}

  void showAlertDialog(
      BuildContext context, List<Customer>? customer, String title) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: setupAlertDialoadContainer(customer),
          );
        });
  }

  void showAlertDialogStaff(
      BuildContext context, List<Staff>? customer, String title) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: setupAlertDialoadContainerStaff(customer),
          );
        });
  }

  void showAlertDialogService(
      BuildContext context, List<Service>? customer, String title) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: setupAlertDialoadContainerService(customer),
          );
        });
  }

  Widget setupAlertDialoadContainer(List<Customer>? customer) {
    return Container(
      height: 250.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: customer!.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  _addAppointmentBloc.add(CustomerClickEvent(customer[index]));
                },
                child: Text(customer[index].name!)),
          );
        },
      ),
    );
  }

  Widget setupAlertDialoadContainerStaff(List<Staff>? customer) {
    return Container(
      height: 250.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: customer!.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  _addAppointmentBloc.add(StaffClickEvent(customer[index]));
                },
                child: Text(customer[index].name!)),
          );
        },
      ),
    );
  }

  Widget setupAlertDialoadContainerService(List<Service>? customer) {
    return Container(
      height: 250.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: customer!.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  _addAppointmentBloc.add(ServiceClickEvent(customer[index]));
                },
                child: Text(customer[index].name!)),
          );
        },
      ),
    );
  }

  Widget dropDownWidget(String text, IconData iconData) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(border: Border.all(color: textColorUnknown)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
          ),
          Icon(
            iconData,
            color: textColorUnknown,
          )
        ],
      ),
    );
  }

  showAlertDialogPop(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Success"),
      content: Text("Appointment Added Successfully"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogCommon(
      BuildContext context, String message, onOkButtonClicked) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        onOkButtonClicked();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Pamper Book"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
