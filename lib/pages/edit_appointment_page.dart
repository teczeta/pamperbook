import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pamperbook/blocks/get_edit_appointment_details/get_edit_appointment_details_bloc.dart';
import 'package:pamperbook/data/models/request/get_edit_appointment_details/EditAppointmentDetailsRequest.dart';
import 'package:pamperbook/data/models/request/update_edit_appointment/UpdateAppointmentRequest.dart';
import 'package:pamperbook/widgets/custom_elevated_button.dart';
import 'package:pamperbook/widgets/text_field_with_border.dart';

import '../constants.dart';
import '../data/models/response/update_edit_appointment/UpdateAppointmentResponse.dart';

class EditAppointmentPage extends StatefulWidget {
  final int appointmentId;

  const EditAppointmentPage({Key? key, required this.appointmentId})
      : super(key: key);

  @override
  State<EditAppointmentPage> createState() => _EditAppointmentPageState();
}

class _EditAppointmentPageState extends State<EditAppointmentPage> {
  GetEditAppointmentDetailsBloc _appointmentDetailsBloc =
  GetEditAppointmentDetailsBloc();

  TextEditingController priceController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  TextEditingController houseNoController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    EditAppointmentDetailsRequest editAppointmentDetailsRequest =
    EditAppointmentDetailsRequest();
    editAppointmentDetailsRequest.action = "getAppointmentDetails";
    DataEdit dataNew = DataEdit();
    dataNew.appointmentId = widget.appointmentId;
    editAppointmentDetailsRequest.data = dataNew;

    _appointmentDetailsBloc.add(
        GetEditAppointmentDetailsResponseEvent(editAppointmentDetailsRequest));
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
        title: const Text("Manage Appointment",
            style: TextStyle(color: textColorUnknown)),
        backgroundColor: primaryColor,
      ),
      body: BlocProvider(
        create: (context) => _appointmentDetailsBloc,
        child: BlocBuilder<GetEditAppointmentDetailsBloc,
            GetEditAppointmentDetailsState>(
          builder: (context, state) {
            if (state is GetEditAppointmentDetailsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetEditAppointmentDetailsLoaded) {
              var data = state.editAppointmentDetailsResponse.data;
              priceController.text = data!.price.toString();
              durationController.text = data!.duration.toString();


              var show =
                  state.editAppointmentDetailsResponse.showLoader ?? false;
              if (show) {
                showAlertDialogCommon(
                    context, "Appointment Updated successfully...", () {
                  houseNoController.text = "";
                  streetController.text = "";
                  townController.text = "";
                  postCodeController.text = "";
                  priceController.text = "";
                  durationController.text = "";
                  notesController.text = "";
                });
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    buildRowItem("First Name:", data!.name!),
                    buildRowItem("Mobile Number:", data.mobile!),
                    buildRowItem("Email:", data.email ?? ""),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: _labelWithTextField(
                              "House No", houseNoController),
                          flex: 1,
                        ),
                        Expanded(
                          child:
                          _labelWithTextField("Street", streetController),
                          flex: 2,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child:
                          _labelWithTextField("Town/City", townController),
                        ),
                        Expanded(
                            child: _labelWithTextField(
                                "Post Code", postCodeController))
                      ],
                    ),
                    buildRowItem("Status:", data.status!),
                    buildRowItem("Ref:", data.ref.toString()),
                    buildRowItem("Staff Name:", data.staffName!),
                    buildRowItem("Service:", data.service!),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 25),
                            child: Text(
                              "Duration",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ),
                        Expanded(
                            child: _labelWithTextField("", durationController)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 25),
                            child: Text(
                              "Price",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ),
                        Expanded(
                            child: _labelWithTextField("", priceController)),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Date and Time:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: GestureDetector(
                              onTap: () {
                                _selectDate(context, DateTime.now());
                              },
                              child: dropDownWidget(
                                  "${ state.editAppointmentDetailsResponse
                                      .selectedDate}".split(' ')[0],
                                  Icons.calendar_today_outlined)),
                        ),
                        Expanded(
                          child: GestureDetector(
                              onTap: () {
                                displayTimePicker(context);
                              },

                              child: dropDownWidget(
                                  TimeOfDay(
                                      hour: state.editAppointmentDetailsResponse
                                          .selectedTime!.hour!,
                                      minute: state
                                          .editAppointmentDetailsResponse
                                          .selectedTime!.minute).format(context)

                                  , Icons.timer)),
                        ),
                      ],
                    ),
                    _labelWithTextField(
                        "Notes", notesController),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: CustomElevatedButton(
                            onButtonClicked: () {
                              UpdateAppointmentRequest
                              updateAppointmentRequest =
                              UpdateAppointmentRequest();

                              updateAppointmentRequest.action =
                              "editAppointment";

                              DataUpdate dataNew = DataUpdate();
                              dataNew.duration =
                                  int.parse(durationController.text.toString());
                              dataNew.appointmentId = 528652;
                              dataNew.date =
                              "${ state.editAppointmentDetailsResponse
                                  .selectedDate}".split(' ')[0];
                              dataNew.time = TimeOfDay(
                                  hour: state.editAppointmentDetailsResponse
                                      .selectedTime!.hour!,
                                  minute: state.editAppointmentDetailsResponse
                                      .selectedTime!.minute).format(context);
                              dataNew.houseNo =
                                  houseNoController.text.toString();
                              dataNew.street = streetController.text.toString();
                              dataNew.townCity = townController.text.toString();
                              dataNew.postCode =
                                  postCodeController.text.toString();
                              dataNew.price =
                                  int.parse(priceController.text.toString());

                              updateAppointmentRequest.data = dataNew;

                              _appointmentDetailsBloc.add(
                                  UpdateAppointmentDetailsResponseEvent(
                                      updateAppointmentRequest));
                            },
                            buttonText: "Submit",
                            fontSize: 20,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, left: 20, bottom: 20),
                      child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: CustomElevatedButton(
                            onButtonClicked: () {},
                            buttonText: "Cancel Appointment",
                            fontSize: 20,
                          )),
                    )
                  ],
                ),
              );
            } else if (state is GetEditAppointmentDetailsError) {
              showAlertDialogCommon(context, state.message!, () {

              });

              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, DateTime? selectedDate) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime.now()!,
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      _appointmentDetailsBloc.add(DateTimeClickEvent(picked));
    }
  }

  Future displayTimePicker(BuildContext context) async {
    var time =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (time != null) {
      _appointmentDetailsBloc.add(TimeClickEvent(time));
    }
  }

  Container buildRowItem(String label, String value) {
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [buildTextItem(label), buildTextItem(value)],
        ));
  }

  Align buildTextItem(String text) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: TextStyle(
            color: textColorUnknown, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _labelWithTextField(String hintText,
      TextEditingController textEditingController) {
    double textFieldHeight = 1;

    if (hintText == "Notes") {
      textFieldHeight = 10;
    }
    return Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 5),
        child: Column(
          children: [
            TextField(
              cursorHeight: 15,
              controller: textEditingController,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15),
              maxLines: textFieldHeight.toInt(),
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

showAlertDialogCommon(BuildContext context, String message, onOkButtonClicked) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
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

loginButtonClicked() {}
