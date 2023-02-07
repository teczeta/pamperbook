import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pamperbook/blocks/dash_board/dash_board_bloc.dart';
import 'package:pamperbook/constants.dart';
import 'package:pamperbook/data/models/request/dash_board/DashBoardRequest.dart';
import 'package:pamperbook/data/models/response/dash_board/DashBoardResponse.dart';
import 'package:pamperbook/pages/business_details_page.dart';
import 'package:pamperbook/pages/cancel_appointment_page.dart';
import 'package:pamperbook/pages/customer_list_page.dart';
import 'package:pamperbook/pages/edit_appointment_page.dart';
import 'package:pamperbook/pages/new_appointment_page.dart';
import 'package:pamperbook/pages/view_appointment_page.dart';
import 'package:pamperbook/widgets/custom_elevated_button.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final DashBoardBloc _dashBoardBloc = DashBoardBloc();
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  void initState() {
    var dashBoardRequest = DashBoardRequest();
    dashBoardRequest.action = "dashboard";
    dashBoardRequest.data = DashBoardData();
    _dashBoardBloc.add(GetDashBoardResponse(dashBoardRequest));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Your DashBoard",
            style: TextStyle(color: textColorBlack)),
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: primaryColor,
      ),
      body: BlocProvider(
        create: (context) => _dashBoardBloc,
        child: BlocListener<DashBoardBloc, DashBoardState>(
          listener: (context, state) {
            if (state is DashBoardLoaded) {
              bool isCompltedRegistration =
                  state.dashBoardResponse.data!.isRegistrationComplete ?? true;

              if (!isCompltedRegistration) {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (_) => BusinessDetailsPage(),
                  ),
                );
              }
            }
          },
          child: BlocBuilder<DashBoardBloc, DashBoardState>(
            builder: (context, state) {
              if (state is DashBoardLoading) {
                return _buildLoading();
              } else if (state is DashBoardLoaded) {
                if (state.dashBoardResponse.data!.pendingAppointmentsCount! >
                    0) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: Text(
                                    "Account Status",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5, left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      state.dashBoardResponse.data!
                                          .accountStatus!,
                                      style: TextStyle(fontSize: 14),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 20, right: 10),
                                child: CustomElevatedButton(
                                    onButtonClicked: () {},
                                    buttonText: "Subscribe Now"))
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              CarouselSlider(
                                carouselController: _controller,
                                options: CarouselOptions(
                                    height: 260.0,
                                    viewportFraction: 1.0,
                                    enlargeCenterPage: false,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _current = index;
                                      });
                                    }),
                                items: state.dashBoardResponse.data!
                                    .upcomingAppointments!
                                    .map((upcomingAppointments) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/bgnewone.jpg"),
                                                fit: BoxFit.cover)),
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 100.0, vertical: 20),
                                          decoration: BoxDecoration(
                                              color: new Color.fromRGBO(39, 39,
                                                  39, 0.5019607843137255)),
                                          child: Column(
                                            children: [
                                              Text(
                                                upcomingAppointments
                                                    .appointmentTime!,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 10),
                                                child: Text(
                                                  upcomingAppointments
                                                      .serviceName!,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 10),
                                                child: Text(
                                                  upcomingAppointments
                                                      .customerName!,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    onPrimary: Colors.black,
                                                    onSurface: dashBoardCardBg,
                                                    primary: dashBoardCardBg,
                                                    textStyle: TextStyle(
                                                        fontSize: 14),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50))),
                                                onPressed: () {
                                                  Navigator.of(context,
                                                          rootNavigator: false)
                                                      .push(
                                                    MaterialPageRoute(
                                                      builder: (_) =>
                                                          CancelAppointment(
                                                              appointmentId:
                                                                  upcomingAppointments
                                                                      .id!),
                                                    ),
                                                  );
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20, right: 20),
                                                  child: Text("View",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: state.dashBoardResponse.data!
                                    .upcomingAppointments!
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  return GestureDetector(
                                    onTap: () =>
                                        _controller.animateToPage(entry.key),
                                    child: Container(
                                      width: 6.0,
                                      height: 6.0,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: (Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black)
                                              .withOpacity(_current == entry.key
                                                  ? 0.9
                                                  : 0.4)),
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              "Pending Appointments",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            )),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.dashBoardResponse.data!
                                .upcomingAppointments!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return appointmentList(
                                  context,
                                  state.dashBoardResponse.data!
                                      .upcomingAppointments![index]);
                            }),
                        Container(
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 40, top: 20),
                          child: CustomElevatedButton(
                              onButtonClicked: () {
                                Navigator.of(context, rootNavigator: false)
                                    .push(
                                  MaterialPageRoute(
                                    builder: (_) => ViewAppointmentPage(),
                                  ),
                                );
                              },
                              buttonText: "View More"),
                        )
                      ],
                    ),
                  );
                } else {
                  return _noAppointmentWidget(context);
                }
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

Widget appointmentList(
        BuildContext context, UpcomingAppointments upcomingAppointments) =>
    Container(
        child: Container(
      child: Container(
        height: 180,
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(top: 10.0, right: 40, left: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(1.0)),
          color: dashBoardCardBg,
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  upcomingAppointments.appointmentTime!,
                  style: TextStyle(
                      color: textColorUnknown,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  upcomingAppointments.serviceName!,
                  style: TextStyle(
                      color: textColorUnknown,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Text(
                upcomingAppointments.customerName!,
                style: TextStyle(
                    color: textColorUnknown,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              Container(
                  width: double.infinity,
                  height: 40,
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        onSurface: textColorBlack,
                        primary: textColorBlack,
                        textStyle: TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: false).push(
                        MaterialPageRoute(
                          builder: (_) => CancelAppointment(
                              appointmentId: upcomingAppointments.id!),
                        ),
                      );
                    },
                    child: Text("View Appointment"),
                  ))
            ],
          ),
        ),
      ),
    ));

Widget _noAppointmentWidget(BuildContext context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Pending Appointments",
              style: TextStyle(
                  color: textColorBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text("You have no pending appointments",
                style: TextStyle(color: textColorBlack, fontSize: 16)),
          ),
          CustomElevatedButton(
            onButtonClicked: () {
              Navigator.of(context, rootNavigator: false).push(
                MaterialPageRoute(
                  builder: (_) => NewAppointmentPage(),
                ),
              );
            },
            buttonText: 'Add Appointment',
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text("BOOKING LINK",
                style: TextStyle(
                    color: Color(0xFF205ADB),
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          )
        ],
      ),
    );

Widget _buildLoading() => const Center(child: CircularProgressIndicator());
