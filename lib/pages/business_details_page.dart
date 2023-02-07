import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pamperbook/blocks/update_business_details/update_business_details_bloc.dart';
import 'package:pamperbook/data/models/request/update_business_details/UpdateBusinessDetailsRequest.dart';
import 'package:pamperbook/data/models/request/update_business_details/Data.dart';
import 'package:pamperbook/pages/bottom_bar_page.dart';
import 'package:pamperbook/widgets/custom_elevated_button.dart';

import '../constants.dart';

class BusinessDetailsPage extends StatefulWidget {
  const BusinessDetailsPage({Key? key}) : super(key: key);

  @override
  State<BusinessDetailsPage> createState() => _BusinessDetailsPageState();
}

class _BusinessDetailsPageState extends State<BusinessDetailsPage> {
  UpdateBusinessDetailsBloc _updateBusinessDetailsBloc =
      UpdateBusinessDetailsBloc();

  TextEditingController businessNamerController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController instaUserNameController = TextEditingController();

  TextEditingController houseNoController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController postalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              Text("Business Details", style: TextStyle(color: textColorBlack)),
          backgroundColor: primaryColor,
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          )),
      body: bodyWidget(),
    );
  }

  bodyWidget() {
    return BlocProvider(
      create: (context) => _updateBusinessDetailsBloc,
      child:
          BlocListener<UpdateBusinessDetailsBloc, UpdateBusinessDetailsState>(
        listener: (context, state) {

          if(state is UpdateBusinessDetailsLoaded){


            if (state.businessDetailsMapper.code == 2000) {
              Future.delayed(Duration.zero, () async {
                showAlertDialogCommon(
                    context, state.businessDetailsMapper.message ?? "", () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                      const BottomNavBarScreen(),
                    ),
                  );
                });
              });
            }

          }

        },
        child:
            BlocBuilder<UpdateBusinessDetailsBloc, UpdateBusinessDetailsState>(
          builder: (context, state) {
            if (state is UpdateBusinessDetailsLoading)
              return Center(
                child: CircularProgressIndicator(),
              );
            else if (state is UpdateBusinessDetailsLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _labelWithTextField("Business Name*", "Enter Business Name",
                        businessNamerController),

                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Business Type*",
                          style: const TextStyle(
                              color: textColorBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          showAlertDialog(context);
                        },
                        child: dropDownWidget(
                            state.businessDetailsMapper.initialValue ??
                                "Selece Type",
                            Icons.arrow_drop_down)),
                    _labelWithTextField("Business Phone Number*",
                        "Enter Phone Number", phoneNumberController),
                    //   _labelWithTextField("Mobile Number*", "Enter Mobile Number", TextEditingController()),
                    _labelWithTextField("Business Email Address*",
                        "Enter Email Address", emailController),
                    _labelWithTextField("Business Description*", "Type...",
                        descriptionController),
                    _labelWithTextField("Business Instagram UserName*",
                        "Enter UserName", instaUserNameController),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
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
                      margin: EdgeInsets.only(left: 20, top: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Optional for ”Freelance” business types.",
                            style: TextStyle(
                                fontSize: 14, color: textColorUnknown)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: _labelWithTextFieldNew(
                              "House No", houseNoController),
                          flex: 1,
                        ),
                        Expanded(
                          child: _labelWithTextFieldNew(
                              "Street", streetController),
                          flex: 2,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: _labelWithTextFieldNew(
                              "Town/City", townController),
                        ),
                        Expanded(
                            child: _labelWithTextFieldNew(
                                "Post Code", postalController)),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10, left: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Checkbox(
                            value: true,
                            activeColor: primaryColor,
                            onChanged: (value) {},
                          ),
                          Expanded(
                              child: const Text(
                            "Make address publicly and visible on my PamperBook webpage",
                            maxLines: 5,
                          ))
                        ],
                      ),
                    ),

                    Container(
                        height: 40,
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        width: double.infinity,
                        child: CustomElevatedButton(
                            onButtonClicked: () {
                              if (validateInputFields(
                                  state.businessDetailsMapper.initialValue)) {
                                UpdateBusinessDetailsRequest
                                    updateBusinessDetailsRequest =
                                    UpdateBusinessDetailsRequest();
                                updateBusinessDetailsRequest.action =
                                    "updateBusinessSettings";
                                Data data = Data();

                                data.businessName =
                                    businessNamerController.text;
                                data.businessType =
                                    state.businessDetailsMapper.initialValue;
                                data.phone = phoneNumberController.text;
                                data.email = emailController.text;
                                data.houseNo = houseNoController.text;
                                data.street = streetController.text;
                                data.postCode = postalController.text;
                                data.isAddressPublic = true;

                                updateBusinessDetailsRequest.data = data;
                                _updateBusinessDetailsBloc.add(
                                    UpdateBusinessDetailsResponseEvent(
                                        updateBusinessDetailsRequest));
                              } else {
                                showAlertDialogCommon(
                                    context, "All Fields are mandatory", (){

                                });
                              }
                            },
                            buttonText: "Submit"))
                  ],
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
              cursorHeight: 12,
              controller: textEditingController,
              textAlign: TextAlign.start,
              maxLines: textFieldHeight,
              minLines: null,
              style: TextStyle(fontSize: 12),
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

  Widget _labelWithTextFieldNew(
      String hintText, TextEditingController textEditingController) {
    double minLines = 1;

    if (hintText.contains("Type...")) {
      minLines = 10;
    }

    return Container(
        margin: const EdgeInsets.only(top: 10, left: 20, right: 5),
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

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Select Type"),
            content: setupAlertDialogContainer(
                ["Salon", "Home", "Freelance", "Mobile", "Venue"]),
          );
        });
  }

  Widget setupAlertDialogContainer(List<String>? country) {
    return SizedBox(
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: country!.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  _updateBusinessDetailsBloc
                      .add(OnClickBusinessTypeEvent(country.elementAt(index)));
                },
                child: Text(country[index])),
          );
        },
      ),
    );
  }

  Widget dropDownWidget(String text, IconData iconData) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
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

  bool validateInputFields(String? initialValue) {
    if (businessNamerController.text.isEmpty ||
        initialValue == "Select Type" ||
        phoneNumberController.text.isEmpty
        //|| mobileController.text.isEmpty
        ||
        emailController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        instaUserNameController.text.isEmpty ||
        houseNoController.text.isEmpty ||
        streetController.text.isEmpty ||
        townController.text.isEmpty ||
        postalController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  showAlertDialogCommon(
      BuildContext context, String message, onOkButtonClicked) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context,rootNavigator: true).pop();
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
