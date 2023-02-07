import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pamperbook/blocks/splash_block/splash_block.dart';
import 'package:pamperbook/blocks/splash_block/splash_event.dart';
import 'package:pamperbook/blocks/splash_block/splash_state.dart';
import 'package:pamperbook/data/models/InitRequest.dart';
import 'package:pamperbook/pages/business_details_page.dart';
import 'package:pamperbook/pages/cancel_appointment_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import 'bottom_bar_page.dart';
import 'landing_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashBloc _splashBloc = SplashBloc();

  @override
  void initState() {

    var initRequest = InitRequest();
    initRequest.action = "init";
    var data =Data();
    data.appVersion = "1.0.0";
    data.deviceDetails = "xxxxxxxx";
    data.deviceId = "xxxxxxxx";
    initRequest.data = data;

    _splashBloc.add(GetInitResponse(initRequest));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _buildListCovid()
    );
  }

  Widget _buildListCovid() {

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _splashBloc,
        child: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) async {
            final prefs = await SharedPreferences.getInstance();

            if(state is InitLoaded){

              if(prefs.getString(token)== null){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const LandingPage(),
                  ),
                );
              }else{
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const BottomNavBarScreen(),
                  ),
                );
              }


            }

          },
          child: BlocBuilder<SplashBloc, SplashState>(
            builder: (context, state) {
              if (state is SplashInitial) {
                return Container();
              } else if (state is SplashLoading) {
                return _buildLoading();
              } else if (state is InitLoaded) {
                return Container();
              } else if (state is SplashError) {
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
  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

}
