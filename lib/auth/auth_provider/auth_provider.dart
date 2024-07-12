import 'dart:convert';
import 'dart:developer';
import 'package:dealsdray/auth/auth_provider/device_info_model.dart';
import 'package:dealsdray/auth/auth_provider/get_product_model.dart';
import 'package:dealsdray/utils/api_support.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:http/http.dart';

class AuthProvider extends ChangeNotifier {
  ResponseModel? registerDeviceInfoResponseModel;
  ResponseModel? sentOtpResponseModel;
  GetProductsModel? getProductsModel;

  Future<void> registerDeviceInfo(
    context,
  ) async {
    final url = Uri.parse(
      ApiSupport.baseUrl + ApiSupport.registerDeviceInfo,
    );

    final response = await post(
      url,
      headers: ApiSupport.headers,
      body: jsonEncode({
        "deviceType": "andriod",
        "deviceId": "C6179909526098",
        "deviceName": "Samsung-MT200",
        "deviceOSVersion": "2.3.6",
        "deviceIPAddress": "11.433.445.66",
        "lat": 9.9312,
        "long": 76.2673,
        "buyer_gcmid": "",
        "buyer_pemid": "",
        "app": {
          "version": "1.20.5",
          "installTimeStamp": "2022-02-10T12:33:30.696Z",
          "uninstallTimeStamp": "2022-02-10T12:33:30.696Z",
          "downloadTimeStamp": "2022-02-10T12:33:30.696Z"
        }
      }),
    );

    if (response.statusCode == 200) {
      registerDeviceInfoResponseModel = responseModelFromJson(response.body);
      notifyListeners();
    } else {
      Fluttertoast.showToast(msg: "Something went wrong");

      // Handle error response here
    }
  }

  bool otpLoading = false;
  Future<bool> sendOtp(
    context, {
    required String mobileNumber,
  }) async {
    otpLoading = true;
    notifyListeners();
    final url = Uri.parse(ApiSupport.baseUrl + ApiSupport.sentOtp);

    final response = await post(
      url,
      headers: ApiSupport.headers,
      body: jsonEncode({
        'mobileNumber': mobileNumber,
        'deviceId': registerDeviceInfoResponseModel?.data?.deviceId,
      }),
    );

    if (response.statusCode == 200) {
      sentOtpResponseModel = responseModelFromJson(response.body);
      otpLoading = false;

      notifyListeners();

      return true;
    } else if (response.statusCode == 400) {
      otpLoading = false;

      floatingSnackBar(
          message: "Somthing went wrong please try again later",
          context: context);
      notifyListeners();

      return false;
    } else if (response.statusCode == 500) {
      otpLoading = false;
      notifyListeners();

      log("7000");
      return false;
    } else {
      log('Failed to send OTP: ${response.statusCode}');
      // Handle error response here
      return false;
    }
  }

  bool verifyloading = false;
  Future<bool> verifyOtp(
    context, {
    required String otp,
  }) async {
    verifyloading = true;
    notifyListeners();
    final url = Uri.parse(
      ApiSupport.baseUrl + ApiSupport.verifyOtp,
    );

    final response = await post(
      url,
      headers: ApiSupport.headers,
      body: jsonEncode({
        "otp": otp,
        "deviceId": registerDeviceInfoResponseModel?.data?.deviceId,
        "userId": sentOtpResponseModel?.data?.userId,
      }),
    );

    if (response.statusCode == 200) {
      sentOtpResponseModel = responseModelFromJson(response.body);
      verifyloading = false;

      notifyListeners();
      return true;
    } else if (response.statusCode == 400) {
      floatingSnackBar(
          message: "Somthing went wrong please try again later",
          context: context);
      verifyloading = false;
      notifyListeners();
      return false;
    } else if (response.statusCode == 500) {
      log("7000");
      verifyloading = false;
      notifyListeners();
      return false;
    } else {
      log('Failed to verify: ${response.statusCode}');
      return false;

      // Handle error response here
    }
  }

  bool registerUserLoading = false;
  Future<bool> registerUserDetails(context,
      {required String email,
      required String password,
      required String referralCode}) async {
    registerUserLoading = true;
    notifyListeners();
    final url = Uri.parse(
      ApiSupport.baseUrl + ApiSupport.addUserDetails,
    );

    final response = await post(
      url,
      headers: ApiSupport.headers,
      body: jsonEncode({
        "email": email,
        "password": password,
        "referralCode": referralCode,
        "userId": sentOtpResponseModel?.data?.userId
      }),
    );

    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: "Successfully Added");
      notifyListeners();
      return false;
    } else {
      log('Failed userRegistration: ${response.statusCode}');
      // Handle error response here
      return false;
    }
  }

  Future<void> getProductDetails(
    context,
  ) async {
    final url = Uri.parse(
      ApiSupport.baseUrl + ApiSupport.getProducts,
    );

    final response = await get(
      url,
      headers: ApiSupport.headers,
    );

    if (response.statusCode == 200) {
      getProductsModel = getProductsModelFromJson(response.body);
      notifyListeners();
    } else {
      log('Failed getProdcts: ${response.statusCode}');
      // Handle error response here
    }
  }
}
