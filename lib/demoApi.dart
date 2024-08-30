import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:learning_flutter/model/Demo.dart';

List<Demo> mList = [];

class ApiDemo extends StatefulWidget {
  const ApiDemo({super.key});

  @override
  State<ApiDemo> createState() => _ApiDemoState();
}

class _ApiDemoState extends State<ApiDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<List<Demo>> getData() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = 'https://jsonplaceholder.typicode.com/photos';
    var uri = Uri.parse(url);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      print('response: ${response.body}');
      var jsonResponse = convert.jsonDecode(response.body);
      for (Map<String, dynamic> map in jsonResponse) {
        mList.add(Demo.fromJson(map));
      }
      print('mList: ${mList.length}.');
      return mList;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return mList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Demo'),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: mList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(mList[index].title!),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
