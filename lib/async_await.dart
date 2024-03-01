/*todo this is simple abstract example*/
class AsyncAwaitClass {
  void execute() async {
    print("Api call start...");
    var apiRes = await callApi();
    print(apiRes);
    print("Api call finish...");
  }
}

Future<String> callApi() {
  return Future.delayed(const Duration(seconds: 3), () => "Api response");
}
