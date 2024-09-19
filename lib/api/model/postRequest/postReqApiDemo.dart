import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learning_flutter/api/model/postRequest/LoginReq.dart';
import 'dart:convert' as convert;

import 'package:learning_flutter/api/model/postRequest/LoginRes.dart';

var loginRes= LoginRes();

class PostApiDemo extends StatefulWidget {
  const PostApiDemo({super.key});

  @override
  State<PostApiDemo> createState() => _PostApiDemoState();
}

class _PostApiDemoState extends State<PostApiDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var loginReq = LoginReq(email: 'eve.holt@reqres.in', password: 'cityslicka');
    getData(loginReq).then((data) {
      String mToken = data.token!;
      print(mToken);
    }, onError: (e) {
      print(e);
    });
  }

  Future<LoginRes> getData(LoginReq loginReq) async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = 'https://reqres.in/api/login';
    var uri = Uri.parse(url);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(uri, body: loginReq.toJson());
    if (response.statusCode == 200) {
      print('response: ${response.body}');
      var jsonResponse = convert.jsonDecode(response.body);
      loginRes = LoginRes.fromJson(jsonResponse);
      return loginRes;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return loginRes;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Demo'),
      ),
    );
  }
}
