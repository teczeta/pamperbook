import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pamperbook/blocks/login/login_block.dart';
import 'package:pamperbook/blocks/login/login_event.dart';
import 'package:pamperbook/blocks/login/login_state.dart';
import 'package:pamperbook/constants.dart';
import 'package:pamperbook/data/models/request/login/LoginRequest.dart';
import 'package:pamperbook/data/models/login/LoginResponse.dart';
import 'package:pamperbook/pages/bottom_bar_page.dart';
import 'package:pamperbook/pages/customer_list_page.dart';
import 'package:pamperbook/pages/dash_board_page.dart';
import 'package:pamperbook/widgets/custom_elevated_button.dart';
import 'package:pamperbook/widgets/text_field_with_border.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginBloc _loginBloc = LoginBloc();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildWidget(),
    );
  }

  Container _buildWidget() {
    return Container(
      margin: EdgeInsets.all(20),
      child: BlocProvider(
        create: (_) => _loginBloc,
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) async {
            final prefs = await SharedPreferences.getInstance();

            if (state is LoginLoaded) {

              prefs.setString(token, state.loginResponse.data!.token!);
              print(prefs.getString(token));

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const BottomNavBarScreen(),
                ),
              );
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginInitial) {
                return _loginWidget();
              } else if (state is LoginLoading) {
                return _buildLoading();
              } else if (state is LoginError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Column _loginWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/pamperbook.png',
          scale: 5,
        ),

        // Note: Same code is applied for the TextFormField as well
        Container(
          margin: EdgeInsets.only(top: 20),
          child: TextFieldWithBorder(
              hint: 'Enter Email', textEditingController: userNameController),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          child: TextFieldWithBorder(
            hint: 'Enter Password',
            textEditingController: passwordController,
            isPassWord: true,
          ),
        ),
        SizedBox(
            width: double.infinity,
            height: 50,
            child: CustomElevatedButton(
              onButtonClicked: loginButtonClicked,
              buttonText: "Login",
              fontSize: 20,
            ))
      ],
    );
  }

   loginButtonClicked() {
    String userName = userNameController.text.toString();
    String passWord = passwordController.text.toString();
    if (userName.isEmpty || passWord.isEmpty) {

    } else {
      var loginRequest = LoginRequest();
      loginRequest.action = "login";
      var data = LoginRequestData();
      data.deviceDetails = "xxxxxxxx";
      data.username = userNameController.text.toString();
      data.password = passwordController.text.toString();
      data.deviceId = "xxxxxxxx";
      loginRequest.data = data;
       _loginBloc.add(GetLoginResponse(loginRequest));

    }



  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

}
