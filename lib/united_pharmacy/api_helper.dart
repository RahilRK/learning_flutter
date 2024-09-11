
import 'model/LoginRequest.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'model/LoginResponse.dart';


Future<LoginResponse> emailLogin(LoginRequest loginReq) async {
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var baseUrl = 'https://staging.unitedpharmacy.sa/en';
  var emailLoginUrl = '$baseUrl/mobikulhttp/customer/logIn';
  var uri = Uri.parse(emailLoginUrl);
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