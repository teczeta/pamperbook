
import 'dart:math';

import 'package:pamperbook/blocks/get_edit_appointment_details/get_edit_appointment_details_bloc.dart';
import 'package:pamperbook/data/models/InitRequest.dart';
import 'package:pamperbook/data/models/InitResponse.dart';
import 'package:pamperbook/data/models/request/customers_list/CustomerListRequest.dart';
import 'package:pamperbook/data/models/request/dash_board/DashBoardRequest.dart';
import 'package:pamperbook/data/models/request/get_appointment_details/GetAppointmentDetailsRequest.dart';
import 'package:pamperbook/data/models/request/login/LoginRequest.dart';
import 'package:pamperbook/data/models/login/LoginResponse.dart';
import 'package:pamperbook/data/models/request/new_appointment/NewAppointmentRequest.dart';
import 'package:pamperbook/data/models/request/new_customer/NewCustomerRequest.dart';
import 'package:pamperbook/data/models/request/register/RegisterRequest.dart';
import 'package:pamperbook/data/models/request/update_business_details/UpdateBusinessDetailsRequest.dart';
import 'package:pamperbook/data/models/request/update_edit_appointment/UpdateAppointmentRequest.dart';
import 'package:pamperbook/data/models/request/verifyEmail/VerifyEmailRequest.dart';
import 'package:pamperbook/data/models/request/view_appoitment/ViewAppointmentListRequest.dart';
import 'package:pamperbook/data/models/response/customers_list/CustomerListResponse.dart';
import 'package:pamperbook/data/models/response/dash_board/DashBoardResponse.dart';
import 'package:pamperbook/data/models/response/get_appointment_details/GetAppointmentDetailsResponse.dart';
import 'package:pamperbook/data/models/response/get_edit_appointment_details/EditAppointmentDetailsResponse.dart';
import 'package:pamperbook/data/models/response/new_appointment/NewAppointmentResponse.dart';
import 'package:pamperbook/data/models/response/new_customer/NewCustomerResponse.dart';
import 'package:pamperbook/data/models/response/register/RegisterResponse.dart';
import 'package:pamperbook/data/models/response/update_business_details/UpdateBusinessDetailsResponse.dart';
import 'package:pamperbook/data/models/response/update_edit_appointment/UpdateAppointmentResponse.dart';
import 'package:pamperbook/data/models/response/view_appoitment/ViewAppoitmentListResponse.dart';

import '../data/models/request/get_edit_appointment_details/EditAppointmentDetailsRequest.dart';
import '../data/models/response/verifyEmail/VerifyEmailResponse.dart';
import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<InitResponse> fetchInitResponse(InitRequest initRequest) {
    try {
      return _provider.fetchInitResponse(initRequest);
    } catch (error, stacktrace) {
      throw Exception(error);
    }
  }

  Future<LoginResponse> fetchLoginResponse(LoginRequest loginRequest) {
    try {
      return _provider.fetchLoginResponse(loginRequest);
    } catch (error, stacktrace) {
      throw Exception(error);
    }
  }

  Future<CustomerListResponse> fetchCustomerListResponse(
      CustomerListRequest customerListRequest) {
    try {
      return _provider.fetchCustomerListResponse(customerListRequest);
    } catch (error, stacktrace) {
      throw Exception(error);
    }
  }
  Future<DashBoardResponse> fetchDashBoardResponse(
      DashBoardRequest dashBoardRequest) {
    try {
      return _provider.fetchDashBoardResponse(dashBoardRequest);
    } catch (error, stacktrace) {
      throw Exception(error);
    }
  }
  Future<ViewAppoitmentListResponse> fetchAppointmentListResponse(
      ViewAppointmentListRequest viewAppoitmentListRequest) {
    try {
      return _provider.fetchAppointmentListResponse(viewAppoitmentListRequest);
    } catch (error, stacktrace) {
      throw Exception(error);
    }
  }
  Future<NewCustomerResponse> fetchNewCustomerResponse(
      NewCustomerRequest newCustomerRequest) {
    try {
      return _provider.fetchNewCustomerResponse(newCustomerRequest);
    } catch (error, stacktrace) {
      throw Exception(error);
    }
  }
  Future<GetAppointmentDetailsResponse> fetchGetAppointmentDetailsResponse(
      GetAppointmentDetailsRequest getAppointmentDetailsRequest) {
    try {
      return _provider.fetchGetAppointmentDetailsResponse(getAppointmentDetailsRequest);
    } catch (error, stacktrace) {
      throw Exception(error);
    }
  }

Future<NewAppointmentResponse> fetchNewAppointmentResponse(
      NewAppointmentRequest newAppointmentRequest) {
    try {
      return _provider.fetchNewAppointmentResponse(newAppointmentRequest);
    } catch (error, stacktrace) {
      throw Exception(error);
    }
  }

  Future<EditAppointmentDetailsResponse> fetchEditAppointmentDetailsResponse(EditAppointmentDetailsRequest editAppointmentDetailsRequest) {
    try {
      return _provider.fetchEditAppointmentDetailsResponse(editAppointmentDetailsRequest);
    } catch (error, stacktrace) {
      throw Exception(error);
    }
  }

  Future<UpdateAppointmentResponse> fetchUpdateAppointmentDetailsResponse(UpdateAppointmentRequest updateAppointmentRequest) {
    try {
      return _provider.fetchUpdateAppointmentDetailsResponse(updateAppointmentRequest);
    } catch (error, stacktrace) {
      throw Exception(error);
    }
  }
  Future<RegisterResponse> fetchRegisterResponse(RegisterRequest registerRequest) {
    try {
      return _provider.fetchRegisterResponse(registerRequest);
    } catch (error, stacktrace) {
      throw Exception(error);
    }
  }

  Future<VerifyEmailResponse> fetchVerifyEmailResponse(VerifyEmailRequest verifyEmailRequest) {
    try {
      return _provider.fetchVerifyEmailResponse(verifyEmailRequest);
    } catch (error, stacktrace) {
      throw Exception(error);
    }
  }
  Future<UpdateBusinessDetailsResponse> fetchUpdateBusinessDetailsResponse(UpdateBusinessDetailsRequest updateBusinessDetailsRequest) {
    try {
      return _provider.fetchUpdateBusinessDetailsResponse(updateBusinessDetailsRequest);
    } catch (error, stacktrace) {
      throw Exception(error);
    }
  }
}

class NetworkError extends Error {}
