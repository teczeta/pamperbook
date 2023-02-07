import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pamperbook/blocks/get_edit_appointment_details/get_edit_appointment_details_bloc.dart';
import 'package:pamperbook/constants.dart';
import 'package:pamperbook/pages/dash_board_page.dart';
import 'package:pamperbook/pages/edit_appointment_page.dart';
import 'package:pamperbook/widgets/custom_elevated_button.dart';

import '../data/models/request/get_edit_appointment_details/EditAppointmentDetailsRequest.dart';

class CancelAppointment extends StatefulWidget {
  final int appointmentId;

  const CancelAppointment({Key? key, required this.appointmentId})
      : super(key: key);

  @override
  State<CancelAppointment> createState() => _CancelAppointmentState();
}

class _CancelAppointmentState extends State<CancelAppointment> {
  GetEditAppointmentDetailsBloc _appointmentDetailsBloc =
  GetEditAppointmentDetailsBloc();

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
        title: Text("View Appointment",
            style: TextStyle(color: textColorBlack)),

        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: _bodyWidget(),
    );
  }

  _bodyWidget() {
    print(widget.appointmentId);
    return BlocProvider(
      create: (context) => _appointmentDetailsBloc,
      child: BlocListener<GetEditAppointmentDetailsBloc, GetEditAppointmentDetailsState>(
        listener: (context, state) {

          if(state is GetCancelAppointmentDetailsLoaded){
            Future.delayed(Duration.zero, () async {
              showAlertDialogCommon(context,
                  state.editAppointmentDetailsResponse.message ?? "", () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (
                            BuildContext context) => const DashBoardPage(),
                      ),
                    );
                  });
            });


          }
        },
        child: BlocBuilder<GetEditAppointmentDetailsBloc,
            GetEditAppointmentDetailsState>(
          builder: (context, state) {
            if (state is GetEditAppointmentDetailsLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetCancelAppointmentDetailsLoaded) {
              return Container();
            } else if (state is GetEditAppointmentDetailsLoaded) {
              var data = state.editAppointmentDetailsResponse.data!;
              return SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(
                      left: 8, right: 8, top: 15, bottom: 15),
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          height: 40,
                          child: CustomElevatedButton(
                              onButtonClicked: () {},
                              buttonText: "REQUEST PAYMENT FROM CUSTOMER")),
                      rowItem("Status:", data.status!, true),
                      rowItem("Ref:", data.ref.toString(), false),
                      rowItem("Customer:", data.name!, true),
                      rowItem("Mobile:", data.mobile!, false),
                      rowItem("Email:", data.email ?? "", true),
                      rowItem("Service:", data.service!, false),
                      rowItem("Staff:", data.staffName!, true),
                      // rowItem("Start:", "", false),
                      // rowItem("End:", "", true),
                      rowItem("Duration:", data.duration!.toString(), false),
                      rowItem("Price:", data.price.toString(), true),
                      rowItem("Notes:", data.notes ?? "", false),
                      rowItem(
                          "Location:",
                          data.houseNo! +
                              "," +
                              data.street! +
                              "," +
                              data.townCity!,
                          true),

                      Container(
                          width: double.infinity,
                          height: 40,
                          margin: EdgeInsets.only(top: 20),
                          child: CustomElevatedButton(
                              onButtonClicked: () {
                                EditAppointmentDetailsRequest editAppointmentDetailsRequest =
                                EditAppointmentDetailsRequest();
                                editAppointmentDetailsRequest.action =
                                "cancelAppointment";
                                DataEdit dataNew = DataEdit();
                                dataNew.appointmentId = widget.appointmentId;
                                editAppointmentDetailsRequest.data = dataNew;

                                _appointmentDetailsBloc.add(
                                    CancelAppointmentClickEvent(
                                        editAppointmentDetailsRequest));
                              },
                              buttonText: "CANCEL APPOINTMENT")),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              onPrimary: Colors.black,
                              onSurface: bgColorforCancelAppointment,
                              primary: bgColorforCancelAppointment,
                              textStyle: TextStyle(fontSize: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)
                              )

                          ),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: false).push(
                              MaterialPageRoute(
                                builder: (_) =>
                                    EditAppointmentPage(
                                        appointmentId: widget.appointmentId),
                              ),
                            );
                          },
                          child: Text("UPDATE APPOINTMENT"),
                        ),
                      ),


                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              onPrimary: Colors.black,
                              onSurface: bgColorforCancelAppointment,
                              primary: bgColorforCancelAppointment,
                              textStyle: TextStyle(fontSize: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)
                              )

                          ),
                          onPressed: () {},
                          child: Text("RE-SEND EMAIL NOTIFICATION"),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Visibility rowItem(String key, String value, bool bgColor) {
    return Visibility(
      visible: value.isNotEmpty,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: bgColor ? textColorUnknownOpacity : Colors.white,
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.all(10),
                child:
                Text(key, style: TextStyle(fontWeight: FontWeight.normal)),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: bgColor ? textColorUnknownOpacity : Colors.white,
                padding: EdgeInsets.all(10),
                child: Text(value,
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialogCommon(BuildContext context, String message,
      onOkButtonClicked) {
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
