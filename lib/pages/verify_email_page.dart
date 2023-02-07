import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:pamperbook/blocks/verify_email/verify_email_bloc.dart';
import 'package:pamperbook/constants.dart';
import 'package:pamperbook/data/models/request/verifyEmail/Data.dart';
import 'package:pamperbook/data/models/request/verifyEmail/VerifyEmailRequest.dart';
import 'package:pamperbook/pages/bottom_bar_page.dart';
import 'package:pamperbook/widgets/custom_elevated_button.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dash_board_page.dart';

class VerifyEmailPage extends StatefulWidget {
  final String email;
  const VerifyEmailPage( {Key? key,required this.email}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  TextEditingController pinController = TextEditingController();
  FocusNode focusNode = FocusNode();

  VerifyEmailBloc _verifyEmailBloc = VerifyEmailBloc();


  String pin= "";
  @override
  Widget build(BuildContext context) {
    ProgressDialog pr = ProgressDialog(context);

    pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Verification",
          style: TextStyle(color: textColorBlack)),
      backgroundColor: primaryColor,
      iconTheme: const IconThemeData(
        color: Colors.black, //change your color here
      ),
    ),
      body: BlocProvider(
        create: (context) => _verifyEmailBloc,
        child: BlocListener<VerifyEmailBloc, VerifyEmailState>(
          listener: (context, state) async {
            if(state is VerifyEmailLoaded){
              final prefs = await SharedPreferences.getInstance();

              int code = state.registerMapper.code ?? 0;
              String tokenValue = state.registerMapper.initialCountryValue ?? "";
              if (code == 2000 && tokenValue.isNotEmpty) {
                prefs.setString(token, tokenValue);
                print(prefs.getString(token));



                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const BottomNavBarScreen(),
                  ),
                );


              }else{

                showAlertDialogCommon(
                    context, state.registerMapper.message ?? "", () {

                });

              }
            }


            },

          child: BlocBuilder<VerifyEmailBloc, VerifyEmailState>(
            builder: (context, state) {
              if (state is VerifyEmailLoaded) {
                if (state.registerMapper.showLoader!) {
                  pr.show();
                } else {
                  Future.delayed(Duration(seconds: 1)).then((value) {
                    pr.hide().whenComplete(() {
                      print(pr.isShowing());
                    });
                  });
                }



                return Container(
                  margin: EdgeInsets.only(top: 100),
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    children: [
                      Text(
                        "Enter Code",
                        style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 40, left: 20, right: 20, bottom: 20),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "We have sent you an email to mail@mail.com with 6 digit verification code.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.only(
                            bottom: 80, left: 10, right: 10, top: 10),
                        color: dashBoardCardBg,
                        child: Column(
                          children: [
                            PinCodeFields(
                              length: 6,
                              borderWidth: 0.5,
                              borderColor: Colors.black,
                              onComplete: (result) {
                                // Your logic with code
                                print(result);
                                pin =result;
                              },
                            ),
                            Container(
                                width: 200,
                                margin: EdgeInsets.only(top: 20),
                                child: CustomElevatedButton(
                                    onButtonClicked: () {

                                      if(pin.isEmpty || pin.length !=6){


                                      }else{
                                        VerifyEmailRequest verifyEmailRequest =VerifyEmailRequest();

                                        verifyEmailRequest.action = "verifyEmail";
                                        Data data = Data();
                                        data.deviceDetails = "XXXXXX";
                                        data.deviceId = "XXXXXX";
                                        data.email = widget.email;
                                        data.verificationCode =pin;
                                        verifyEmailRequest.data = data;
                                        _verifyEmailBloc.add(VerifyEmailResponseEvent(verifyEmailRequest));

                                        print(pin);
                                        pr.show();

                                      }
                                    },
                                    buttonText: "Submit")),
                          ],
                        ),
                      ),
                      Text(
                        "Did not receive the code ?",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Resend?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: verificationTextColor),
                            ),
                            Text(
                              "Change Email Address",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: verificationTextColor),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
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

}
