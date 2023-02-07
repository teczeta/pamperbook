import 'package:flutter/material.dart';
import 'package:pamperbook/pages/login_page.dart';
import 'package:pamperbook/pages/register_page.dart';
import 'package:pamperbook/widgets/custom_elevated_button.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [

        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100, left: 30, right: 30),
                padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                height: 500,
                color: Colors.white.withOpacity(0.5),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/pamperbook.png',
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 100),
                      child: Text(
                        "Let’s get Started",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Once you’ve registered for a PamperBook account, simply return here & login to start your digital journey with us!",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                  height: 50,
                  width: double.infinity,
                  child: CustomElevatedButton(
                      onButtonClicked: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ));
                      }, buttonText: "REGISTER")),
              Container(
                  margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                  height: 50,
                  width: double.infinity,
                  child: CustomElevatedButton(
                      onButtonClicked: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                      }, buttonText: "LOGIN"))
            ],
          ),
        )
      ],
    ));
  }
}
