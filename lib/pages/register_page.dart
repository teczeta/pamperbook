import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pamperbook/blocks/register/register_bloc.dart';
import 'package:pamperbook/data/models/request/register/Data.dart';
import 'package:pamperbook/data/models/request/register/RegisterRequest.dart';
import 'package:pamperbook/pages/verify_email_page.dart';

import '../constants.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/text_field_with_border.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBloc _registerBloc = RegisterBloc();

  List<String> countryList = ["United Kingdom", "Spain"];
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 80, left: 20, right: 20),
        child: BlocProvider(
          create: (context) => _registerBloc,
          child: BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {


            if(state is RegisterLoaded){

              if(state.registerMapper.message!.isNotEmpty){
                int code = state.registerMapper.code ?? 0;
                if(code == 2000){
                  Future.delayed(Duration.zero, () async {
                    showAlertDialogCommon(context, state.registerMapper.message ?? "", (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => VerifyEmailPage(email: emailController.text),
                      ));

                    });

                  });
                }else{
                  showAlertDialogCommon(context, state.registerMapper.message ?? "", (){
                  });

                }
              }


            }

            },
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                if (state is RegisterLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                else if (state is RegisterLoaded) {


                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/pamperbook.png',
                          scale: 5,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFieldWithBorder(
                              hint: 'First Name',
                              textEditingController: firstNameController),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFieldWithBorder(
                            hint: 'Last Name',
                            textEditingController: lastNameController,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFieldWithBorder(
                            hint: 'Business Name',
                            textEditingController: businessNameController,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFieldWithBorder(
                            hint: 'Email Address',
                            textInputType: TextInputType.emailAddress,
                            textEditingController: emailController,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFieldWithBorder(
                            hint: 'Contact Number',
                            textInputType: TextInputType.phone,
                            textEditingController: phoneController,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFieldWithBorder(
                            hint: 'Instagram',
                            textEditingController: instagramController,
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              showAlertDialog(context);
                            },
                            child: dropDownWidget(
                                state.registerMapper.initialCountryValue ?? "Country",
                                Icons.arrow_drop_down)),
/*              Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: TextFieldWithBorder(
                  hint: 'Discount Code',
                  textEditingController: TextEditingController(),
              ),
            )*/
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFieldWithBorder(
                            hint: 'Enter Password',
                            textEditingController: passwordController,
                            isPassWord: true,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 10,
                          ),
                          child: TextFieldWithBorder(
                            hint: 'Confirm Password',
                            textEditingController: confirmPasswordController,
                            isPassWord: true,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Checkbox(
                                value: true,
                                activeColor: primaryColor,
                                onChanged: (value) {},
                              ),
                              const Text("I Accept terms and conditions")
                            ],
                          ),
                        ),
                        SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: CustomElevatedButton(
                              onButtonClicked: () {
                                /* Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => VerifyEmailPage(),
                      ));*/


                                String firstName = firstNameController.text;
                                String lastName = lastNameController.text;
                                String email = emailController.text;
                                String businessName = businessNameController
                                    .text;
                                String phone = phoneController.text;
                                String instagram = instagramController.text;
                                String password = passwordController.text;
                                String confirmPassword = confirmPasswordController
                                    .text;


                                if (
                                firstName.isEmpty
                                    || lastName.isEmpty
                                    || email.isEmpty
                                    || businessName.isEmpty
                                    || phone.isEmpty
                                    || instagram.isEmpty
                                    || password.isEmpty
                                    || confirmPassword.isEmpty

                                ) {
                                  showAlertDialogOk(
                                      context, "All Fields are Mandatory");
                                }
                                else if (password != confirmPassword) {
                                  showAlertDialogOk(context,
                                      "Password and Confirm Password Does not match");
                                } else {
                                  RegisterRequest registerRequest = RegisterRequest();

                                  registerRequest.action = "register";
                                  Data data = Data();
                                  data.lastName = lastName;
                                  data.email = email;
                                  data.firstName = firstName;
                                  data.businessName = businessName;
                                  data.phone = phone;
                                  data.instagram = instagram;
                                  data.country =
                                      state.registerMapper.initialCountryValue;
                                  data.password = password;
                                  data.deviceId = "XXXXXXXX";
                                  data.deviceDetails = "XXXXXXXX";

                                  registerRequest.data = data;

                                  _registerBloc.add(
                                      RegisterResponseEvent(registerRequest));
                                }
                              },
                              buttonText: "Agree and Create Account",
                              fontSize: 20,
                            ))
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
      ),
    );
  }

  Widget dropDownWidget(String text, IconData iconData) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(color: textColorUnknown, width: 0.3)),
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

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Select Country"),
            content: setupAlertDialogContainer(countryList),
          );
        });
  }

  Widget setupAlertDialogContainer(List<String>? country) {
    return SizedBox(
      height: 150.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: country!.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  _registerBloc.add(CountryClickEvent(country[index]));
                },
                child: Text(country[index])),
          );
        },
      ),
    );
  }

  showAlertDialogOk(BuildContext context, String message) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
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




