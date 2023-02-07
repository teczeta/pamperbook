import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pamperbook/blocks/add_appointement/add_appointment_bloc.dart';
import 'package:pamperbook/blocks/view_appointment_list/view_appointment_list_bloc.dart';
import 'package:pamperbook/data/mapper/view_appointment_mapper.dart';
import 'package:pamperbook/data/models/request/view_appoitment/ViewAppointmentListRequest.dart';
import 'package:pamperbook/pages/cancel_appointment_page.dart';
import 'package:pamperbook/pages/edit_appointment_page.dart';
import 'package:pamperbook/pages/new_appointment_page.dart';

import '../constants.dart';

class ViewAppointmentPage extends StatefulWidget {
  const ViewAppointmentPage({Key? key}) : super(key: key);

  @override
  State<ViewAppointmentPage> createState() => _ViewAppointmentPageState();
}

class _ViewAppointmentPageState extends State<ViewAppointmentPage> {
  List<String> litems = ["All", "Upcoming", "Pending", "Past", "Cancelled"];

  final ViewAppointmentListBloc _viewAppointmentListBloc =
      ViewAppointmentListBloc();

  @override
  void initState() {
    var viewAppointmentListRequest = ViewAppointmentListRequest();
    viewAppointmentListRequest.action = "appointmentList";
    var appointmentListData = Data();

    viewAppointmentListRequest.data = appointmentListData;

    _viewAppointmentListBloc
        .add(GetViewAppointmentListResponse(viewAppointmentListRequest));
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
        title: const Text("View Appointment",
            style: TextStyle(color: textColorBlack)),
        backgroundColor: primaryColor,
      ),
      body: Container(
        child: BlocProvider(
          create: (context) => _viewAppointmentListBloc,
          child: BlocBuilder<ViewAppointmentListBloc, ViewAppointmentListState>(
            builder: (context, state) {
              if (state is ViewAppointmentListLoading) {
                return _buildLoading();
              } else if (state is ViewAppointmentListLoaded) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      color: viewPaymentCardBg,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (Filters item in state.viewAppointmentMapper.filters!)
                            GestureDetector(
                              onTap: (){
                                _viewAppointmentListBloc.add(FilterItemClickEvent(item.item));
                              },
                              child: Text(
                                item.item!,
                                style: TextStyle(fontSize: 20,
                                  fontWeight: item.isSelected! ? FontWeight.bold : FontWeight.normal
                                ),
                              ),
                            ),

                          /*  Text(
                            "All",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Upcoming",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Pending",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Past",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Cancelled",
                            style: TextStyle(fontSize: 20),
                          ),
                  */
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        child: ListView.separated(
                            itemCount:
                                state.viewAppointmentMapper.customer!.length,
                            separatorBuilder:
                                (BuildContext context, int index) => Divider(
                                      height: 1,
                                      thickness: 0.1,
                                      color: textColorBlack,
                                    ),
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            state.viewAppointmentMapper
                                                .customer![index].customerName!,
                                            style: TextStyle(
                                                color: textColorUnknown,
                                                fontSize: 18),
                                          ))),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              state
                                                  .viewAppointmentMapper
                                                  .customer![index]
                                                  .serviceName!,
                                              style: TextStyle(
                                                  color: textColorUnknown,
                                                  fontSize: 16),
                                            ),
                                          )),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 5, right: 5),
                                            child: IconButton(
                                              icon: Icon(Icons
                                                  .remove_red_eye_outlined),
                                              onPressed: () {
                                                Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(
                                                  builder: (_) => CancelAppointment(appointmentId: state
                                                      .viewAppointmentMapper
                                                      .customer![index].id!),
                                                ),
                                                );
                                              },
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 5, right: 5),
                                            child: IconButton(
                                              icon: Icon(Icons.add),
                                              onPressed: () {
                                                Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(
                                                  builder: (_) => NewAppointmentPage(),
                                                ),
                                                );                                              },
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 5, right: 5),
                                            child: IconButton(
                                              icon: Icon(Icons.edit),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                    context) =>
                                                        EditAppointmentPage(
                                                           appointmentId: state.viewAppointmentMapper.customer![index].id!,
                                                        ),
                                                  ),
                                                );


                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              );
                            }),
                      ),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
    ;
  }
}

Widget _buildLoading() => Center(child: CircularProgressIndicator());
