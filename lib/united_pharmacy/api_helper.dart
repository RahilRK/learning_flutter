
import 'package:learning_flutter/united_pharmacy/model/request/HomePageDataFirstRequest.dart';
import 'package:learning_flutter/united_pharmacy/model/request/RegistrationRequest.dart';
import 'package:learning_flutter/united_pharmacy/model/request/VerificationRequest.dart';
import 'package:learning_flutter/united_pharmacy/model/response/RegistrationResponse.dart';
import 'package:learning_flutter/united_pharmacy/model/response/VerificationResponse.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageFirstResponse.dart';
import 'package:learning_flutter/united_pharmacy/model/response/home/HomePageSecondResponse.dart';

import 'model/request/LoginRequest.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'model/response/LoginResponse.dart';

var stagingUrl = 'https://staging.unitedpharmacy.sa/en';
var baseUrl = 'https://unitedpharmacy.sa/en';

Future<LoginResponse> logIn(LoginRequest loginReq) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var logIn = '$stagingUrl/mobikulhttp/customer/logIn';
  var uri = Uri.parse(logIn);
  var loginRes= LoginResponse();

  // Await the http get response, then decode the json-formatted response.
  var response = await http.post(uri, body: loginReq.toJson());
  if (response.statusCode == 200) {
    print('response: ${response.body}');
    var jsonResponse = convert.jsonDecode(response.body);
    loginRes = LoginResponse.fromJson(jsonResponse);
    return loginRes;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return loginRes;
  }
}

Future<VerificationResponse> sendotp(VerificationRequest verificationReq) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var sendotp = '$stagingUrl/mobikulhttp/customer/sendotp';
  var uri = Uri.parse(sendotp);
  var loginRes= VerificationResponse();

  // Await the http get response, then decode the json-formatted response.
  var response = await http.post(uri, body: verificationReq.toJson());
  if (response.statusCode == 200) {
    print('response: ${response.body}');
    var jsonResponse = convert.jsonDecode(response.body);
    loginRes = VerificationResponse.fromJson(jsonResponse);
    return loginRes;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return loginRes;
  }
}

Future<RegistrationResponse> createAccount(RegistrationRequest registrationReq) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var createAccount = '$stagingUrl/mobikulhttp/customer/createAccount';
  var uri = Uri.parse(createAccount);
  var loginRes= RegistrationResponse();

  // Await the http get response, then decode the json-formatted response.
  var response = await http.post(uri, body: registrationReq.toJson());
  if (response.statusCode == 200) {
    print('response: ${response.body}');
    var jsonResponse = convert.jsonDecode(response.body);
    loginRes = RegistrationResponse.fromJson(jsonResponse);
    return loginRes;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return loginRes;
  }
}

Future<HomePageFirstResponse> homepagedatafirst(HomePageDataFirstRequest request) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var createAccount = '$baseUrl/mobile/catalog/homepagedatafirst';

  Map<String, String> queryParams = request.toJson();

  var uri = Uri.parse(createAccount).replace(queryParameters: queryParams);
  var homePageFirstResponse= HomePageFirstResponse();

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(uri);
  if (response.statusCode == 200) {
    print('homepagedatafirst response: ${response.body}');
    var jsonResponse = convert.jsonDecode(response.body);
    homePageFirstResponse = HomePageFirstResponse.fromJson(jsonResponse);
    return homePageFirstResponse;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return homePageFirstResponse;
  }
}

Future<HomePageSecondResponse> homepagedatasecond(HomePageDataFirstRequest request) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var createAccount = '$baseUrl/mobile/catalog/homepagedatasecond';

  Map<String, String> queryParams = request.toJson();

  var uri = Uri.parse(createAccount).replace(queryParameters: queryParams);
  var homePageFirstResponse= HomePageSecondResponse();

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(uri);
  if (response.statusCode == 200) {
    print('homepagedatasecond response: ${response.body}');
    var jsonResponse = convert.jsonDecode(response.body);
    homePageFirstResponse = HomePageSecondResponse.fromJson(jsonResponse);
    return homePageFirstResponse;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return homePageFirstResponse;
  }
}