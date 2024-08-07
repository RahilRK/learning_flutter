import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DemoScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
              "Demo text",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.red),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {

  int _checkedRadioValue = 1;

  bool _checkedBox1Value = false;
  bool _checkedBox2Value = false;
  bool _checkedBox3Value = false;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        elevation: 8,
        shadowColor: Colors.black,
        // leading: Icon(Icons.home),
        title: Text("Home"),
        actions: [Icon(Icons.search), Icon(Icons.more_vert)],
        // actionsIconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      "images/brainvire_logo.png",
                      height: 54,
                      width: 54,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Brainvire",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                ),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text("Gallery"),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Logout"),
                )
              ],
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          children: <Widget>[
            /*todo flexible eg*/
            /*Flexible(
              flex: 2,
              child: Container(
                child: Text("First"),
                color: Colors.blue,
                padding: EdgeInsets.all(30),
                alignment: Alignment.center,
              ),
            ),
            Flexible(
                flex: 4,
                child: Container(
                  child: Text("Second"),
                  color: Colors.green,
                  padding: EdgeInsets.all(30),
                  alignment: Alignment.center,
                )),
            Flexible(
                flex: 6,
                child: Container(
                  child: Text("Third"),
                  color: Colors.orange,
                  padding: EdgeInsets.all(30),
                  alignment: Alignment.center,
                ))*/

            /*todo Container eg*/
            /*Center(
              child: Container(
                height: 250,
                width: 250,
                // padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(24),
                // color: Colors.purpleAccent,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    border: Border.all(color: Colors.black, width: 3),
                    // borderRadius: const BorderRadius.all(Radius.circular(16)),
                    // boxShadow: const [BoxShadow(blurRadius: 15.0)],
                    shape: BoxShape.circle),
                child: const Text(
                  "Abc",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            )*/

            /*todo Buttons eg*/
            /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton.icon(
                icon: Icon(Icons.location_on_outlined),
                  label: Text("Get location"),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.red,
                    elevation: 16,
                    shadowColor: Colors.black,
                    side: BorderSide(color: Colors.black),
                    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5.0))
                  ),
                  onPressed: () {
                    print("onPressed");
                  },
                  onLongPress: () {
                    print("onLongPress");
                  }),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                  icon: Icon(Icons.location_on_outlined),
                  label: Text("Get location"),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.red,
                      elevation: 16,
                      shadowColor: Colors.black,
                      side: BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                  ),
                  onPressed: () {
                    print("onPressed");
                  },
                  onLongPress: () {
                    print("onLongPress");
                  }),
            )*/
            // child: Text("Text Button"))

            /*todo TextField eg*/
            /*Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                maxLines: 1,
                maxLength: 10,

                obscureText: true,//for password field
                obscuringCharacter: "*",

                // autofocus: true,
                // enabled: false,
                // readOnly: true,

                decoration: InputDecoration(
                    labelText: "Phone number",
                    // hintText: "Phone number",
                    // hintStyle: TextStyle(color: Colors.red),
                    helperText: "Enter phone number",
                    // icon: Icon(Icons.phone),
                    prefixIcon: Icon(Icons.phone),
                    // suffixIcon: Icon(Icons.more_horiz),
                    prefixText: "+91",
                    // suffixText: ".com",
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        // borderSide: BorderSide.none,
                        // borderRadius: BorderRadius.circular(32)
                        ),
                     enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)) ),
              ),
            )*/

            /*todo image eg*/
            /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "images/brainvire_logo.png",
                fit: BoxFit.fill,
                // height: 100,
                // width: 100,
                semanticLabel: "This is demo image",
                color: Colors.black12,
                colorBlendMode: BlendMode.darken,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                height: 100,
                width: 100,
                semanticLabel: "This is demo image",
              ),
            )*/

            /*todo stack & positioned eg*/
            /*Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    child: Text("Third"),
                    color: Colors.orange,
                    padding: EdgeInsets.all(30),
                    alignment: Alignment.center,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: Text("Second"),
                    color: Colors.green,
                    padding: EdgeInsets.all(30),
                    alignment: Alignment.center,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Text("First"),
                      color: Colors.blue,
                      padding: EdgeInsets.all(30),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            )*/

            /*todo IndexedStack eg*/
            /*Padding(
              padding: const EdgeInsets.all(16.0),
              child: IndexedStack(
                index: 2,
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    child: Text("Third"),
                    color: Colors.orange,
                    padding: EdgeInsets.all(30),
                    alignment: Alignment.center,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: Text("Second"),
                    color: Colors.green,
                    padding: EdgeInsets.all(30),
                    alignment: Alignment.center,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 150,
                      width: 150,
                      child: Text("First"),
                      color: Colors.blue,
                      padding: EdgeInsets.all(30),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            )*/

            /*todo Clipper eg*/
            /*Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipOval(
                // borderRadius: BorderRadius.circular(16),
                child: Align(
                  heightFactor: 0.5,
                  widthFactor: 0.9,
                  child: Image.network(
                    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                  ),
                ),
              ),
            )*/

            /*todo Radio button eg*/
            /*Row(
              children: [
                Radio(
                    value: 1,
                    groupValue: _checkedRadioValue,
                    onChanged: (value) {
                      setState(() {
                        _checkedRadioValue = value!;
                      });
                    }),
                SizedBox(
                  width: 10,
                ),
                Text("Red")
              ],
            ),
            Row(
              children: [
                Radio(
                    value: 2,
                    groupValue: _checkedRadioValue,
                    onChanged: (value) {
                      setState(() {
                        _checkedRadioValue = value!;
                      });
                    }),
                SizedBox(
                  width: 10,
                ),
                Text("Blue")
              ],
            ),
            Row(
              children: [
                Radio(
                    value: 3,
                    groupValue: _checkedRadioValue,
                    onChanged: (value) {
                      setState(() {
                        _checkedRadioValue = value!;
                      });
                    }),
                SizedBox(
                  width: 10,
                ),
                Text("Green")
              ],
            ),*/

            /*todo Checkbox eg*/
            /*Row(
              children: [
                Checkbox(
                    value: _checkedBox1Value,
                    onChanged: (value) {
                      setState(() {
                        _checkedBox1Value = value!;
                      });
                    }),
                SizedBox(
                  width: 10,
                ),
                Text("Audi")
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: _checkedBox2Value,
                    onChanged: (value) {
                      setState(() {
                        _checkedBox2Value = value!;
                      });
                    }),
                SizedBox(
                  width: 10,
                ),
                Text("Mercedes")
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: _checkedBox3Value,
                    onChanged: (value) {
                      setState(() {
                        _checkedBox3Value = value!;
                      });
                    }),
                SizedBox(
                  width: 10,
                ),
                Text("BMW")
              ],
            ),*/

            /*todo card eg*/
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 300,
                  width: 300,
                  child: Card(
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    color: Colors.red,
                    elevation: 16,
                  )),
            )


          ],

          // crossAxisAlignment: CrossAxisAlignment.center,
          // verticalDirection: VerticalDirection.up,
          // mainAxisAlignment: MainAxisAlignment.center,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
