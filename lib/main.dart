import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      // home: const PopupOptionMenuEg(),
      // home: NavigationBarEg(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    print("lifeCycle: initState");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("lifeCycle: didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("lifeCycle: didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("lifeCycle: deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("lifeCycle: dispose");
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    print("lifeCycle: build");
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
        title: const Text("Home"),
        actions: const [
          Icon(Icons.search),
          Icon(Icons.more_vert),
        ],
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
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Brainvire",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const Column(
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
            /*Padding(
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
            )*/

            /*todo Custom widget eg*/
            /*CustomButton(
              text: "Login",
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              onButtonClick: () {
                print("onButtonClick");
              },
            )*/

            /*todo SegmentedButton widget with Single selection eg*/
            /*Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChoice(),
            ),*/

            /*todo SegmentedButton widget with Multiple selection eg*/
            /*Padding(
              padding: EdgeInsets.all(8.0),
              child: MultipleChoice(),
            )*/

            /*todo Alert dialogue eg*/
            /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: AlertDialogueEg(),
            ),*/

            /*todo ListTile eg*/
            /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.abc_outlined),
                  title: Text("This is title"),
                  subtitle: Text("This is subtitle"),
                  trailing: Icon(Icons.check),
                  onTap: () {
                    print("onTap");
                  },
                ),
              ),
            ),*/

            /*todo BottomSheet eg*/
            /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: BottomSheetEg(),
            )*/

            /*todo Date Picker eg*/
            /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: DatePickerEg(),
            ),*/

            /*todo Time Picker eg*/
            /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: TimePickerEg(),
            ),*/

            /*todo Chip eg*/
            /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChipEg(),
            ),*/

            /*todo ListView eg*/
            /*ListEg()*/

            /*todo Horizontal ListView eg*/
            /*HorizontalListEg()*/

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownMenuEg(),
            )

          ],
          // crossAxisAlignment: CrossAxisAlignment.center,
          // verticalDirection: VerticalDirection.up,
          // mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('This is snake bar!'),
            action: SnackBarAction(
              label: "Dismiss",
              onPressed: () {},
            ),
          ));
        },
        label: const Text('Add'),
        icon: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.onButtonClick,
  });

  final String text;
  final Color foregroundColor;
  final Color backgroundColor;
  final Function()? onButtonClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: onButtonClick,
          style: TextButton.styleFrom(
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
          ),
          child: Text(text)),
    );
  }
}

enum Calendar { day, week, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
            value: Calendar.day,
            label: Text('Day'),
            icon: Icon(Icons.calendar_view_day)),
        ButtonSegment<Calendar>(
            value: Calendar.week,
            label: Text('Week'),
            icon: Icon(Icons.calendar_view_week)),
        ButtonSegment<Calendar>(
            value: Calendar.month,
            label: Text('Month'),
            icon: Icon(Icons.calendar_view_month)),
        ButtonSegment<Calendar>(
            value: Calendar.year,
            label: Text('Year'),
            icon: Icon(Icons.calendar_today)),
      ],
      selected: {calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          calendarView = newSelection.first;
        });
      },
    );
  }
}

enum Sizes { extraSmall, small, medium, large, extraLarge }

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text('XS')),
        ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
        ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
        ButtonSegment<Sizes>(
          value: Sizes.large,
          label: Text('L'),
        ),
        ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
      ],
      selected: selection,
      onSelectionChanged: (newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}

class AlertDialogueEg extends StatelessWidget {
  const AlertDialogueEg({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Text("This is title"),
                  content: const Text("This is content"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                )),
        child: const Text("Show Dialogue"));
  }
}

class BottomSheetEg extends StatelessWidget {
  const BottomSheetEg({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Wrap(
                children: [
                  ListTile(
                    leading: Icon(Icons.abc_outlined),
                    title: Text("This is title 1"),
                    subtitle: Text("This is subtitle 1"),
                    trailing: Icon(Icons.close),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.abc_outlined),
                    title: Text("This is title 2"),
                    subtitle: Text("This is subtitle 2"),
                    trailing: Icon(Icons.close),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.abc_outlined),
                    title: Text("This is title 3"),
                    subtitle: Text("This is subtitle 3"),
                    trailing: Icon(Icons.close),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            }),
        child: const Text("Show Bottom sheet"));
  }
}

class NavigationBarEg extends StatefulWidget {
  const NavigationBarEg({super.key});

  @override
  State<NavigationBarEg> createState() => _NavigationBarEgState();
}

class _NavigationBarEgState extends State<NavigationBarEg> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
              icon: Badge(child: Icon(Icons.notifications_sharp)),
              label: 'Notifications'),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
            ),
            label: 'Messages',
          ),
        ],
      ),
      body: [
        /// Home page
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Home page',
              ),
            ),
          ),
        ),

        /// Notification page
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Notification page',
              ),
            ),
          ),
        ),

        /// Message page
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Message page',
              ),
            ),
          ),
        ),
      ][currentPageIndex],
    );
  }
}

class DatePickerEg extends StatefulWidget {
  const DatePickerEg({super.key});

  @override
  State<DatePickerEg> createState() => _DatePickerEgState();
}

class _DatePickerEgState extends State<DatePickerEg> {
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    dateController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: dateController, //editing controller of this TextField
      decoration: const InputDecoration(
          icon: Icon(Icons.calendar_today), //icon of text field
          labelText: "Enter Date" //label text of field
          ),
      readOnly: true, // when true user cannot edit text
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //get today's date
            firstDate: DateTime(2000),
            //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2101));
        if (pickedDate != null) {
          print(
              pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          print(
              formattedDate); //formatted date output using intl package =>  2022-07-04
          setState(() {
            dateController.text = formattedDate;
          });
        }
      },
    );
  }
}

class TimePickerEg extends StatefulWidget {
  const TimePickerEg({super.key});

  @override
  State<TimePickerEg> createState() => _TimePickerEgState();
}

class _TimePickerEgState extends State<TimePickerEg> {
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    dateController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);

    return TextField(
      controller: dateController, //editing controller of this TextField
      decoration: const InputDecoration(
          icon: Icon(Icons.calendar_today), //icon of text field
          labelText: "Enter Time" //label text of field
          ),
      readOnly: true, // when true user cannot edit text
      onTap: () async {
        TimeOfDay? pickedTime =
            await showTimePicker(context: context, initialTime: selectedTime);
        if (pickedTime != null && pickedTime != selectedTime) {
          selectedTime = pickedTime;
          print(selectedTime);
          final formattedTimeOfDay =
              localizations.formatTimeOfDay(selectedTime);
          print(formattedTimeOfDay);
          setState(() {
            dateController.text = formattedTimeOfDay;
          });
        }
      },
    );
  }
}

class ChipEg extends StatefulWidget {
  const ChipEg({super.key});

  @override
  State<ChipEg> createState() => _ChipEgState();
}

class _ChipEgState extends State<ChipEg> {
  final List<String> _filters = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(runSpacing: 8, spacing: 8, children: [
          InputChip(
            label: Text("filter label"),
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            backgroundColor: Colors.blue,
            avatar: CircleAvatar(
              child: Text('AZ'),
              backgroundColor: Colors.white.withOpacity(0.8),
            ),
            onPressed: () => print("input chip pressed"),
            onDeleted: () => print("input chip deleted"),
          )
        ]),
        Wrap(
          spacing: 8.0,
          children: <String>['Chip 1', 'Chip 2', 'Chip 3'].map((String name) {
            return FilterChip(
              label: Text(name),
              selected: _filters.contains(name),
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    _filters.add(name);
                  } else {
                    _filters.removeWhere((String item) => item == name);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class ListEg extends StatefulWidget {
  const ListEg({super.key});

  @override
  State<ListEg> createState() => _ListEgState();
}

class _ListEgState extends State<ListEg> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              leading: Icon(Icons.label),
              title: Text(
                "Title 1",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Subtitle 1"),
              trailing: Text("Trailing"),
              onTap: () {
                print("onTap");
              },
            ),
            ListTile(
              leading: Icon(Icons.label),
              title: Text(
                "Title 2",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Subtitle 2"),
              trailing: Icon(Icons.remove_circle),
              onTap: () {
                print("onTap");
              },
            ),
            ListTile(
              leading: Icon(Icons.label),
              title: Text(
                "Title 3",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Subtitle 3"),
              onTap: () {
                print("onTap");
              },
            ),
          ],
        ),
      ],
    );
  }
}

class HorizontalListEg extends StatefulWidget {
  const HorizontalListEg({super.key});

  @override
  State<HorizontalListEg> createState() => _HorizontalListEgState();
}

class _HorizontalListEgState extends State<HorizontalListEg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 154,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 160,
            color: Colors.red,
          ),
          Container(
            width: 160,
            color: Colors.blue,
          ),
          Container(
            width: 160,
            color: Colors.green,
          ),
          Container(
            width: 160,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}

class PopupOptionMenuEg extends StatefulWidget {
  const PopupOptionMenuEg({super.key});

  @override
  State<PopupOptionMenuEg> createState() => _PopupOptionMenuEgState();
}

class _PopupOptionMenuEgState extends State<PopupOptionMenuEg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.add),
                  title: Text('Item 1'),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.anchor),
                  title: Text('Item 2'),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.article),
                  title: Text('Item 3'),
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(child: Text('Item A')),
              const PopupMenuItem(child: Text('Item B')),
            ],
          ),
        ],
      ),
    );
  }
}

class DropdownMenuEg extends StatefulWidget {
  const DropdownMenuEg({super.key});

  @override
  State<DropdownMenuEg> createState() => _DropdownMenuEgState();
}

class _DropdownMenuEgState extends State<DropdownMenuEg> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = "Menu B";
    return Row(
      children: [

        Text("Select menu:"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton(
              value: dropdownValue,
              items: <DropdownMenuItem>[
                DropdownMenuItem(value: "Menu A", child: Text("Menu A")),
                DropdownMenuItem(value: "Menu B", child: Text("Menu B")),
                DropdownMenuItem(value: "Menu C", child: Text("Menu C")),
              ],
              onChanged: (value) {

                setState(() {
                  dropdownValue = value;
                });

              }),
        ),
      ],
    );
  }
}
