import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'DemoList.dart';


List<DemoList> mList = [];

class GetApiDemo extends StatefulWidget {
  const GetApiDemo({super.key});

  @override
  State<GetApiDemo> createState() => _GetApiDemoState();
}

class _GetApiDemoState extends State<GetApiDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<List<DemoList>> getData() async {
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
        mList.add(DemoList.fromJson(map));
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
              return ListView.separated(
                physics: BouncingScrollPhysics(),
                // itemCount: mList.length,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: ClipOval(
                          child: Image.network(mList[index].thumbnailUrl!,
                              fit: BoxFit.cover)),
                      title: Text(mList[index].title!),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: ClipOval(
                          child: Image.network(mList[index].thumbnailUrl!,
                              fit: BoxFit.cover)),
                      title: Text(mList[index].title!),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
