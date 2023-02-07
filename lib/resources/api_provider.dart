import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pamperbook/blocks/add_appointement/add_appointment_bloc.dart';
import 'package:pamperbook/blocks/dash_board/dash_board_bloc.dart';
import 'package:pamperbook/blocks/get_edit_appointment_details/get_edit_appointment_details_bloc.dart';
import 'package:pamperbook/data/models/InitRequest.dart';
import 'package:pamperbook/data/models/InitResponse.dart';
import 'package:pamperbook/data/models/request/customers_list/CustomerListRequest.dart';
import 'package:pamperbook/data/models/request/dash_board/DashBoardRequest.dart';
import 'package:pamperbook/data/models/request/get_edit_appointment_details/EditAppointmentDetailsRequest.dart';
import 'package:pamperbook/data/models/request/new_customer/NewCustomerRequest.dart';
import 'package:pamperbook/data/models/request/register/RegisterRequest.dart';
import 'package:pamperbook/data/models/request/update_business_details/UpdateBusinessDetailsRequest.dart';
import 'package:pamperbook/data/models/request/update_edit_appointment/UpdateAppointmentRequest.dart';
import 'package:pamperbook/data/models/request/verifyEmail/VerifyEmailRequest.dart';
import 'package:pamperbook/data/models/request/view_appoitment/ViewAppointmentListRequest.dart';
import 'package:pamperbook/data/models/response/dash_board/DashBoardResponse.dart';
import 'package:pamperbook/data/models/request/login/LoginRequest.dart';
import 'package:pamperbook/data/models/login/LoginResponse.dart';
import 'package:pamperbook/data/models/response/customers_list/CustomerListResponse.dart';
import 'package:pamperbook/data/models/response/get_appointment_details/GetAppointmentDetailsResponse.dart';
import 'package:pamperbook/data/models/response/get_edit_appointment_details/EditAppointmentDetailsResponse.dart';
import 'package:pamperbook/data/models/response/new_appointment/NewAppointmentResponse.dart';
import 'package:pamperbook/data/models/response/new_customer/NewCustomerResponse.dart';
import 'package:pamperbook/data/models/response/register/RegisterResponse.dart';
import 'package:pamperbook/data/models/response/update_business_details/UpdateBusinessDetailsResponse.dart';
import 'package:pamperbook/data/models/response/update_edit_appointment/UpdateAppointmentResponse.dart';
import 'package:pamperbook/data/models/response/verifyEmail/VerifyEmailResponse.dart';
import 'package:pamperbook/data/models/response/view_appoitment/ViewAppoitmentListResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../data/models/request/get_appointment_details/GetAppointmentDetailsRequest.dart';
import '../data/models/request/new_appointment/NewAppointmentRequest.dart';



class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://pb.teczeta.com/api';

  Future<GetAppointmentDetailsResponse> fetchGetAppointmentDetailsResponse(GetAppointmentDetailsRequest getAppointmentDetailsRequest) async {

    SharedPreferences sharedPreferences = await getSharedPrefs();

    var tokenVal = sharedPreferences.getString(token);

    _dio.options.headers["Authorization"] = "Bearer $tokenVal";

    try {
      Response response = await _dio.post(_url,data: jsonEncode(getAppointmentDetailsRequest));
      return GetAppointmentDetailsResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return throw Exception(error);
    }
  }
  Future<InitResponse> fetchInitResponse(InitRequest initRequest) async {
    try {
      Response response = await _dio.post(_url,data: jsonEncode(initRequest));
      return InitResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return throw Exception(error);
    }
  }
  Future<LoginResponse> fetchLoginResponse(LoginRequest loginRequest) async {
    try {
      Response response = await _dio.post(_url,data: jsonEncode(loginRequest));
      return LoginResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return throw Exception(error);
    }
  }
  Future<VerifyEmailResponse> fetchVerifyEmailResponse(VerifyEmailRequest verifyEmailRequest) async {
    try {
      Response response = await _dio.post(_url,data: jsonEncode(verifyEmailRequest));
      return VerifyEmailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return throw Exception(error);
    }
  }
  Future<CustomerListResponse> fetchCustomerListResponse(CustomerListRequest customerListRequest) async {

    SharedPreferences sharedPreferences = await getSharedPrefs();

    var tokenVal = sharedPreferences.getString(token);

      _dio.options.headers["Authorization"] = "Bearer $tokenVal";


    try {
      Response response = await _dio.post(_url,data: jsonEncode(customerListRequest));
      return CustomerListResponse.fromJson((response.data));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return throw Exception(error);
    }
  }
  Future<DashBoardResponse> fetchDashBoardResponse(DashBoardRequest dashBoardRequest) async {

    SharedPreferences sharedPreferences = await getSharedPrefs();

    var tokenVal = sharedPreferences.getString(token);

      _dio.options.headers["Authorization"] = "Bearer $tokenVal";


    try {
      Response response = await _dio.post(_url,data: jsonEncode(dashBoardRequest));
      return DashBoardResponse.fromJson((response.data));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return throw Exception(error);
    }
  }

  Future<SharedPreferences> getSharedPrefs() async {

    return await SharedPreferences.getInstance();
  }

  Future<ViewAppoitmentListResponse> fetchAppointmentListResponse(ViewAppointmentListRequest viewAppoitmentListRequest) async {
    SharedPreferences sharedPreferences = await getSharedPrefs();

    var tokenVal = sharedPreferences.getString(token);

    _dio.options.headers["Authorization"] = "Bearer $tokenVal";


    try {
      Response response = await _dio.post(_url,data: jsonEncode(viewAppoitmentListRequest));
      return ViewAppoitmentListResponse.fromJson((response.data));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return throw Exception(error);
    }

  }

  Future<NewCustomerResponse> fetchNewCustomerResponse(NewCustomerRequest newCustomerRequest) async {
    SharedPreferences sharedPreferences = await getSharedPrefs();

    var tokenVal = sharedPreferences.getString(token);

    _dio.options.headers["Authorization"] = "Bearer $tokenVal";


    try {
      Response response = await _dio.post(_url,data: jsonEncode(newCustomerRequest));
      return NewCustomerResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return throw Exception(error);
    }

  }
  Future<NewAppointmentResponse> fetchNewAppointmentResponse(NewAppointmentRequest newAppointmentRequest) async {
    SharedPreferences sharedPreferences = await getSharedPrefs();

    var tokenVal = sharedPreferences.getString(token);

    _dio.options.headers["Authorization"] = "Bearer $tokenVal";


    try {
      Response response = await _dio.post(_url,data: jsonEncode(newAppointmentRequest));
      return NewAppointmentResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return throw Exception(error);
    }

  }

  Future<EditAppointmentDetailsResponse> fetchEditAppointmentDetailsResponse(EditAppointmentDetailsRequest editAppointmentDetailsRequest) async {
    SharedPreferences sharedPreferences = await getSharedPrefs();

    var tokenVal = sharedPreferences.getString(token);

    _dio.options.headers["Authorization"] = "Bearer $tokenVal";


    try {
      Response response = await _dio.post(_url,data: jsonEncode(editAppointmentDetailsRequest));
      return EditAppointmentDetailsResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return throw Exception(error);
    }

  }

  Future<UpdateAppointmentResponse> fetchUpdateAppointmentDetailsResponse(UpdateAppointmentRequest updateAppointmentRequest) async {
    SharedPreferences sharedPreferences = await getSharedPrefs();

    var tokenVal = sharedPreferences.getString(token);

    _dio.options.headers["Authorization"] = "Bearer $tokenVal";


    try {
      Response response = await _dio.post(_url,data: jsonEncode(updateAppointmentRequest));
      return UpdateAppointmentResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return throw Exception(error);
    }

  }
  Future<RegisterResponse> fetchRegisterResponse(RegisterRequest registerRequest) async {


    try {
      Response response = await _dio.post(_url,data: jsonEncode(registerRequest));
      return RegisterResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return throw Exception(error);
    }

  }

  Future<UpdateBusinessDetailsResponse> fetchUpdateBusinessDetailsResponse(UpdateBusinessDetailsRequest updateBusinessDetailsRequest) async {
    SharedPreferences sharedPreferences = await getSharedPrefs();

    var tokenVal = sharedPreferences.getString(token);

    _dio.options.headers["Authorization"] = "Bearer $tokenVal";


    try {
      Response response = await _dio.post(_url,data: jsonEncode(updateBusinessDetailsRequest));
      return UpdateBusinessDetailsResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return throw Exception(error);
    }
  }
}


