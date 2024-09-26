import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:learning_flutter/bloc/counter/counter_bloc.dart';
import 'package:learning_flutter/bloc/visibility/counter_bloc.dart';
import 'package:learning_flutter/bloc_api_eg/bloc/product_list_bloc.dart';
import 'package:learning_flutter/bloc_api_eg/data/provider/product_list_provider.dart';
import 'package:learning_flutter/bloc_api_eg/data/repository/product_list_repository.dart';
import 'package:learning_flutter/cubit/counter/counter_cubit.dart';
import 'package:learning_flutter/theme/color.dart';
import 'package:learning_flutter/theme/theme.dart';
import 'package:learning_flutter/united_pharmacy/route_generator_for_united_pharmacy.dart';

import 'bloc/increment_eg.dart';
import 'bloc_api_eg/product_list.dart';
import 'cubit/cubit_increment_eg.dart';

void main() {
  runApp(const MyCubitApp());
  // runApp(const MyBlocApiApp());
  // runApp(const MaterialMyApp());
  // runApp(const DarkModeMyApp());
  // runApp(const CupertinoMyApp());
}

class MaterialMyBlocApp extends StatelessWidget {
  const MaterialMyBlocApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Bloc App',
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
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.color_247EAD),
        useMaterial3: false,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CounterBloc(),
          ),
          BlocProvider(
            create: (context) => VisibilityBloc(),
          ),
        ],
        child: IncrementEg(),
      ),
    );
  }
}

class MyBlocApiApp extends StatelessWidget {
  const MyBlocApiApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Bloc Api App',
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
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.color_247EAD),
        useMaterial3: false,
      ),
      home: RepositoryProvider(
        create: (context) => ProductListRepository(ProductListProvider()),
        child: BlocProvider(
          create: (context) =>
              ProductListBloc(context.read<ProductListRepository>()),
          child: ProductList(),
        ),
      ),
    );
  }
}

class MyCubitApp extends StatelessWidget {
  const MyCubitApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Cubit App',
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
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.color_247EAD),
        useMaterial3: false,
      ),
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: const CubitIncrementEg(),
      ),
    );
  }
}

class MaterialMyApp extends StatelessWidget {
  const MaterialMyApp({super.key});

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
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.color_247EAD),
        useMaterial3: false,
        /*textTheme: TextTheme(
          displaySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.red), 
          displayMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.blue), 
          displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green), 
        ),*/
      ),
      // home: const DemoScreen(title: 'Flutter Demo Home Page'),
      // home: const DemoScreen(),
      // home: const MyFormEg(),
      // home: const PopupOptionMenuEg(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: DemoScreen(),
      // home: GetApiDemo(),
      // home: PostApiDemo(),
      // home: LoginTab(),
      // home: SplashScreen(),
      // home: Registration(),
      // home: FirstPage(),
      initialRoute: '/',

      /*todo 2nd way to navigate*/
      /*routes: {
        '/secondPage':(_)=>SecondPage(data: 'ABC')
      },*/

      /*todo 3rd way to navigate*/
      onGenerateRoute: RouteGeneratorForUnitedPharmacy.generateRoute,
    );
  }
}

class CupertinoMyApp extends StatelessWidget {
  const CupertinoMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoDemoApp(),
      // home: CupertinoTabScaffoldEg(),
      // home: CupertinoListTileEg(),
      // home: CupertinoActionSheetEg(),
    );
  }
}

class DarkModeMyApp extends StatefulWidget {
  const DarkModeMyApp({super.key});

  @override
  State<DarkModeMyApp> createState() => _DarkModeMyAppState();
}

class _DarkModeMyAppState extends State<DarkModeMyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const DarkModeScreen(),
    );
  }
}

class DarkModeScreen extends StatefulWidget {
  const DarkModeScreen({super.key});

  @override
  State<DarkModeScreen> createState() => _DarkModeScreenState();
}

class _DarkModeScreenState extends State<DarkModeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark Mode Screen'),
        elevation: 16,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*todo Buttons eg*/
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Login'),
              ),
            ),
            // child: Text("Text Button"))
          ],
        ),
      ),
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
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  int _checkedRadioValue = 1;

  bool _checkedBox1Value = false;
  bool _checkedBox2Value = false;
  bool _checkedBox3Value = false;

  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  Future<String> mFuture = Future.delayed(
    const Duration(seconds: 2),
    () => 'Rahil',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          /*todo TextView with TextStyle theme*/
          /*Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Red', style: Theme.of(context).textTheme.displaySmall),
                Text('Blue', style: Theme.of(context).textTheme.displayMedium),
                Text('Green', style: Theme.of(context).textTheme.displayLarge),
                Text('Black', style: boldItalicStyle()),
                Text('Custom Font', style: customFontStyle()),
              ],
            ),
          ),*/

          /*todo FutureBuilder eg*/
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
                future: mFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('${snapshot.data}');
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    return const Text('No data found');
                  }
                }),
          ),

          /*todo Autocomplete eg*/
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Autocomplete(
              optionsBuilder: (value) {
                if (value.text == '') {
                  return const Iterable<String>.empty();
                }
                return _kOptions.where((String option) {
                  return option.contains(value.text.toLowerCase());
                });
              },
              onSelected: (selectedText) {
                print('You selected $selectedText');
              },
            ),
          ),

          /*todo flexible eg*/
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(30),
              alignment: Alignment.center,
              child: const Text("First"),
            ),
          ),
          Flexible(
              flex: 4,
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(30),
                alignment: Alignment.center,
                child: const Text("Second"),
              )),
          Flexible(
              flex: 6,
              child: Container(
                color: Colors.orange,
                padding: const EdgeInsets.all(30),
                alignment: Alignment.center,
                child: const Text("Third"),
              )),

          /*todo Container eg*/
          Center(
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
          ),

          /*todo Buttons eg*/
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
                icon: const Icon(Icons.location_on_outlined),
                label: const Text("Get location"),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.red,
                    elevation: 16,
                    shadowColor: Colors.black,
                    side: const BorderSide(color: Colors.black),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0))),
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
                icon: const Icon(Icons.location_on_outlined),
                label: const Text("Get location"),
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.red,
                    elevation: 16,
                    shadowColor: Colors.black,
                    side: const BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {
                  print("onPressed");
                },
                onLongPress: () {
                  print("onLongPress");
                }),
          ),
          // child: Text("Text Button"))

          /*todo TextField eg*/
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              maxLines: 1,
              maxLength: 10,

              obscureText: true,
              //for password field
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
                      borderSide: BorderSide(color: Colors.red))),
            ),
          ),

          /*todo image eg*/
          Padding(
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
          ),

          /*todo stack & positioned eg*/
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 250,
                  width: 250,
                  color: Colors.orange,
                  padding: const EdgeInsets.all(30),
                  alignment: Alignment.center,
                  child: const Text("Third"),
                ),
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.green,
                  padding: const EdgeInsets.all(30),
                  alignment: Alignment.center,
                  child: const Text("Second"),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.blue,
                    padding: const EdgeInsets.all(30),
                    alignment: Alignment.center,
                    child: const Text("First"),
                  ),
                ),
              ],
            ),
          ),

          /*todo IndexedStack eg*/
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IndexedStack(
              index: 2,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 250,
                  width: 250,
                  color: Colors.orange,
                  padding: const EdgeInsets.all(30),
                  alignment: Alignment.center,
                  child: const Text("Third"),
                ),
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.green,
                  padding: const EdgeInsets.all(30),
                  alignment: Alignment.center,
                  child: const Text("Second"),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.blue,
                    padding: const EdgeInsets.all(30),
                    alignment: Alignment.center,
                    child: const Text("First"),
                  ),
                ),
              ],
            ),
          ),

          /*todo Clipper eg*/
          Padding(
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
          ),

          /*todo Radio button eg*/
          Row(
            children: [
              Radio(
                  value: 1,
                  groupValue: _checkedRadioValue,
                  onChanged: (value) {
                    setState(() {
                      _checkedRadioValue = value!;
                    });
                  }),
              const SizedBox(
                width: 10,
              ),
              const Text("Red")
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
              const SizedBox(
                width: 10,
              ),
              const Text("Blue")
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
              const SizedBox(
                width: 10,
              ),
              const Text("Green")
            ],
          ),

          /*todo Checkbox eg*/
          Row(
            children: [
              Checkbox(
                  value: _checkedBox1Value,
                  onChanged: (value) {
                    setState(() {
                      _checkedBox1Value = value!;
                    });
                  }),
              const SizedBox(
                width: 10,
              ),
              const Text("Audi")
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
              const SizedBox(
                width: 10,
              ),
              const Text("Mercedes")
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
              const SizedBox(
                width: 10,
              ),
              const Text("BMW")
            ],
          ),

          /*todo card eg*/
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: 300,
                width: 300,
                child: Card(
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  color: Colors.red,
                  elevation: 16,
                )),
          ),

          /*todo Custom widget eg*/
          CustomButton(
            text: "Login",
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            onButtonClick: () {
              print("onButtonClick");
            },
          ),

          /*todo SegmentedButton widget with Single selection eg*/
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChoice(),
          ),

          /*todo SegmentedButton widget with Multiple selection eg*/
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: MultipleChoice(),
          ),

          /*todo Alert dialogue eg*/
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AlertDialogueEg(),
          ),

          /*todo ListTile eg*/
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.abc_outlined),
                title: const Text("This is title"),
                subtitle: const Text("This is subtitle"),
                trailing: const Icon(Icons.check),
                onTap: () {
                  print("onTap");
                },
              ),
            ),
          ),

          /*todo BottomSheet eg*/
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: BottomSheetEg(),
          ),

          /*todo Date Picker eg*/
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: DatePickerEg(),
          ),

          /*todo Time Picker eg*/
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TimePickerEg(),
          ),

          /*todo Chip eg*/
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: ChipEg(),
          ),

          /*todo ListView eg*/
          const ListEg(),

          /*todo Horizontal ListView eg*/
          const HorizontalListEg(),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownMenuEg(),
          ),
        ],
      ),
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
                    leading: const Icon(Icons.abc_outlined),
                    title: const Text("This is title 1"),
                    subtitle: const Text("This is subtitle 1"),
                    trailing: const Icon(Icons.close),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.abc_outlined),
                    title: const Text("This is title 2"),
                    subtitle: const Text("This is subtitle 2"),
                    trailing: const Icon(Icons.close),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.abc_outlined),
                    title: const Text("This is title 3"),
                    subtitle: const Text("This is subtitle 3"),
                    trailing: const Icon(Icons.close),
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

List<Widget> pageList = [
  const Dashboard(),
  const Settings(),
];

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
            NavigationDestination(
                icon: Icon(Icons.dashboard), label: 'Dashboard'),
            NavigationDestination(
                icon: Badge(child: Icon(Icons.settings)), label: 'Settings'),
          ],
        ),
        body: pageList.elementAt(currentPageIndex));
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Dashboard',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Divider(
              height: 16,
              color: Colors.transparent,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/NormalScreen');
                },
                child: const Text('Press here to navigate'))
          ],
        ),
      ),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({
    super.key,
  });

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Settings',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Divider(
              height: 16,
              color: Colors.transparent,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/NormalScreen',
                      arguments: 'I came from Settings page');
                },
                child: const Text('Press here to navigate'))
          ],
        ),
      ),
    );
  }
}

class Message extends StatefulWidget {
  const Message({
    super.key,
  });

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Message',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Divider(
              height: 16,
              color: Colors.transparent,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/NormalScreen');
                },
                child: const Text('Press here to navigate'))
          ],
        ),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Profile',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Divider(
              height: 16,
              color: Colors.transparent,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/DetailScreen',
                      arguments: 'I came from Profile page');
                },
                child: const Text('Press here to navigate'))
          ],
        ),
      ),
    );
  }
}

class Favourite extends StatefulWidget {
  const Favourite({
    super.key,
  });

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Favourite',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class NormalScreen extends StatelessWidget {
  const NormalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NormalScreen'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'NormalScreen',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String data;

  const DetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Data: $data',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),
      ),
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
            label: const Text("filter label"),
            labelStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
            backgroundColor: Colors.blue,
            avatar: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.8),
              child: const Text('AZ'),
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
              leading: const Icon(Icons.label),
              title: const Text(
                "Title 1",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Subtitle 1"),
              trailing: const Text("Trailing"),
              onTap: () {
                print("onTap");
              },
            ),
            ListTile(
              leading: const Icon(Icons.label),
              title: const Text(
                "Title 2",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Subtitle 2"),
              trailing: const Icon(Icons.remove_circle),
              onTap: () {
                print("onTap");
              },
            ),
            ListTile(
              leading: const Icon(Icons.label),
              title: const Text(
                "Title 3",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Subtitle 3"),
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
    return SizedBox(
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
        title: const Text("Title"),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
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
        const Text("Select menu:"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton(
              value: dropdownValue,
              items: const <DropdownMenuItem>[
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

class ExampleDestination {
  const ExampleDestination(
      this.label, this.icon, this.selectedIcon, this.selectedScreen);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
  final Widget selectedScreen;
}

const List<ExampleDestination> destinations = <ExampleDestination>[
  ExampleDestination(
      'Messages', Icon(Icons.message_outlined), Icon(Icons.message), Message()),
  ExampleDestination('Profile', Icon(Icons.account_circle_outlined),
      Icon(Icons.account_circle), Profile()),
  ExampleDestination('Favourite', Icon(Icons.bookmark_border_rounded),
      Icon(Icons.bookmark), Favourite()),
];

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  int screenIndex = 0;

  void onNavDrawerSelected(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
      // Then close the drawer
      Navigator.pop(context);
    });
  }

  void onBottomNavSelected(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(destinations[screenIndex].label),
        ),
        drawer: NavigationDrawer(
          onDestinationSelected: onNavDrawerSelected,
          selectedIndex: screenIndex,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
              child: Text(
                'Header',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ...destinations.map(
              (ExampleDestination destination) {
                return NavigationDrawerDestination(
                  label: Text(destination.label),
                  icon: destination.icon,
                  selectedIcon: destination.selectedIcon,
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
              child: Divider(),
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          labelBehavior: labelBehavior,
          onDestinationSelected: onBottomNavSelected,
          indicatorColor: Colors.amber,
          selectedIndex: screenIndex,
          destinations: destinations.map(
            (ExampleDestination destination) {
              return NavigationDestination(
                label: destination.label,
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
                tooltip: destination.label,
              );
            },
          ).toList(),
        ),
        body: destinations.elementAt(screenIndex).selectedScreen);
  }
}

/*todo Cupertino UI*/
enum ChooseGender { Male, Female }

enum Sky { Midnight, Viridian, Cerulean }

Map<Sky, Color> skyColors = <Sky, Color>{
  Sky.Midnight: const Color(0xff191970),
  Sky.Viridian: const Color(0xff40826d),
  Sky.Cerulean: const Color(0xff007ba7),
};

class CupertinoDemoApp extends StatefulWidget {
  const CupertinoDemoApp({super.key});

  @override
  State<CupertinoDemoApp> createState() => _CupertinoDemoAppState();
}

class _CupertinoDemoAppState extends State<CupertinoDemoApp> {
  bool checkBoxValue = false;
  double dragValue = 0.0;
  final ChooseGender _character = ChooseGender.Male;
  String text = '';
  Sky _selectedSegment = Sky.Midnight;
  late TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(text: "");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: CupertinoButton(
              child: const Text(
                'Back',
                style: TextStyle(fontSize: 13),
              ),
              onPressed: () {
                // Add your back button action here
                Navigator.of(context).pop();
              },
            ),
            middle: const Text("CupertinoDemoApp"),
            trailing: CupertinoButton(
              child: const Text(
                'Save',
                style: TextStyle(fontSize: 13),
              ),
              onPressed: () {
                // Add your save button action here
              },
            ),
          ),
          child: CupertinoListSection(
            separatorColor: Colors.transparent,
            children: [
              /*todo CupertinoButton eg*/
              /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                    child: Text("Login 1"),
                    onPressed: () {
                      print("Login is clicked");
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton.filled(
                    child: Text("Login 2"),
                    onPressed: () {
                      print("Login is clicked");
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton.filled(
                    child: Text("Login 3"), onPressed: null),
              ),*/

              /*todo normal widgets*/
              /*CupertinoActivityIndicator(
                color: Colors.lightBlue,
                radius: 20,
              ),

              CupertinoCheckbox(
                value: checkBoxValue,
                activeColor: CupertinoColors.black,
                onChanged: (value) {
                  setState(() {
                    checkBoxValue = value!;
                  });
                },
              ),

              CupertinoSwitch(
                value: checkBoxValue,
                activeColor: CupertinoColors.black,
                onChanged: (value) {
                  setState(() {
                    checkBoxValue = value;
                  });
                },
              ),

              CupertinoSlider(
                value: dragValue,
                divisions: 5,
                max: 100,
                activeColor: CupertinoColors.black,
                thumbColor: CupertinoColors.black,
                onChangeStart: (value) {
                  print("onChangeStart: $value");
                },
                onChanged: (value) {
                  setState(() {
                    dragValue = value;
                  });
                },
                onChangeEnd: (value) {
                  print("onChangeEnd: $value");
                },
              ),*/

              /*todo list*/
              /*CupertinoListTileEg(),
              CupertinoFormSectionEg(),*/

              /*todo radio button eg*/
              /*CupertinoListSection(
                children: [
                  CupertinoListTile(
                    title: Text(ChooseGender.Male.name),
                    leading: CupertinoRadio(
                      value: ChooseGender.Male,
                      onChanged: (value) {
                        setState(() {
                          _character = value;
                        });
                      },
                      groupValue: _character,
                    ),
                  ),
                  CupertinoListTile(
                    title: Text(ChooseGender.Female.name),
                    leading: CupertinoRadio(
                      value: ChooseGender.Female,
                      onChanged: (value) {
                        setState(() {
                          _character = value;
                        });
                      },
                      groupValue: _character,
                    ),
                  ),
                ],
              ),*/

              /*todo Search TextField eg*/
              /*Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(text),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CupertinoSearchTextFieldEg(
                      fieldValue: (String value) {
                        setState(() {
                          text = value;
                        });
                      },
                    ),
                  ),
                ],
              ),*/

              /*todo Cupertino Segmented Control eg*/
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoSegmentedControl(
                  selectedColor: skyColors[_selectedSegment],
                  groupValue: _selectedSegment,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  onValueChanged: (value) {
                    setState(() {
                      _selectedSegment = value;
                    });
                  },
                  children: {
                    Sky.Midnight: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(Sky.Midnight.name),
                    ),
                    Sky.Viridian: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(Sky.Viridian.name),
                    ),
                    Sky.Cerulean: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(Sky.Cerulean.name),
                    ),
                  },
                ),
              ),

              /*todo Sliding Segmented Control eg*/
              /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoSlidingSegmentedControl(
                  backgroundColor: CupertinoColors.systemGrey2,
                  thumbColor: skyColors[_selectedSegment]!,
                  groupValue: _selectedSegment,
                  onValueChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedSegment = value;
                      });
                    }
                  },
                  children: {
                    Sky.Midnight: Text(
                      Sky.Midnight.name,
                      style: TextStyle(color: CupertinoColors.white),
                    ),
                    Sky.Viridian: Text(
                      Sky.Viridian.name,
                      style: TextStyle(color: CupertinoColors.white),
                    ),
                    Sky.Cerulean: Text(
                      Sky.Cerulean.name,
                      style: TextStyle(color: CupertinoColors.white),
                    ),
                  },
                ),
              ),*/

              /*todo Cupertino TextField eg*/
              /*CupertinoTextField(
                placeholder: "Enter name",
                controller: controller,
                onChanged: (value){
                  controller.text = value;
                },
              ),*/

              Form(
                autovalidateMode: AutovalidateMode.always,
                child: CupertinoTextFormFieldRow(
                  prefix: const Text("Enter name"),
                  placeholder: "Name",
                  validator: (text) {
                    print("text: $text");
                    if (text == null || text.isEmpty) {
                      return "Please enter the name";
                    }
                    return null;
                  },
                ),
              )
            ],
          )),
    );
  }
}

const double _kItemExtent = 32.0;
const List<String> _fruitNames = <String>[
  'Apple',
  'Mango',
  'Banana',
  'Orange',
  'Pineapple',
  'Strawberry',
];

class CupertinoActionSheetEg extends StatefulWidget {
  const CupertinoActionSheetEg({super.key});

  @override
  State<CupertinoActionSheetEg> createState() => _CupertinoActionSheetEgState();
}

class _CupertinoActionSheetEgState extends State<CupertinoActionSheetEg> {
  final int _selectedFruit = 0;
  Duration duration = const Duration(hours: 04, minutes: 30);
  DateTime date = DateTime(2016, 10, 26);

  void _showPicker(child) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => Container(
              height: 254,
              padding: const EdgeInsets.only(top: 6),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  void _showActionSheet(context) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
              title: const Text("Title"),
              message: const Text("Message"),
              actions: [
                CupertinoActionSheetAction(
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Please wait")),
                CupertinoActionSheetAction(
                    isDefaultAction: false,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
                CupertinoActionSheetAction(
                    isDestructiveAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Delete")),
              ],
            ));
  }

  void _showAlertDialogue(context) {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text("Title"),
              content: const Text("Content"),
              actions: [
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No"),
                ),
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Yes"),
                ),
              ],
            ));
  }

  String _printDuration(Duration duration) {
    String negativeSign = duration.isNegative ? '-' : '';
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
    return "$negativeSign${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
      child: CupertinoButton(
        // child: Text("CupertinoActionSheet: ${_fruitNames[_selectedFruit]}"),
        // child: Text("CupertinoActionSheet: Time is ${_printDuration(duration)}"),
        child: Text(
            "CupertinoActionSheet: Date is ${DateFormat('yyyy-MM-dd').format(date)}"),
        onPressed: () => _showPicker(
          /*todo simple picker*/
          /*CupertinoPicker(
            magnification: 1.22,
            squeeze: 1.2,
            useMagnifier: true,
            itemExtent: _kItemExtent,
            // This sets the initial item.
            scrollController: FixedExtentScrollController(
              initialItem: _selectedFruit,
            ),
            // This is called when selected item is changed.
            onSelectedItemChanged: (int selectedItem) {
              print("selectedItem: $selectedItem");
              setState(() {
                _selectedFruit = selectedItem;
              });
            },
            children: List<Widget>.generate(_fruitNames.length, (int index) {
              return Center(child: Text(_fruitNames[index]));
            }),
          ),*/

          /*todo time picker*/
          /*CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.hm,
            initialTimerDuration: duration,
            // This is called when the user changes the timer's
            // duration.
            onTimerDurationChanged: (Duration newDuration) {
              setState(() => duration = newDuration);
            },
          ),*/

          CupertinoDatePicker(
            initialDateTime: date,
            mode: CupertinoDatePickerMode.date,
            use24hFormat: true,
            // This shows day of week alongside day of month
            showDayOfWeek: true,
            // This is called when the user changes the date.
            onDateTimeChanged: (DateTime newDate) {
              setState(() => date = newDate);
            },
          ),
        ),
        // onPressed: () => _showActionSheet(context),
        // onPressed: () => _showAlertDialogue(context),
      ),
    ));
  }
}

class CupertinoListTileEg extends StatelessWidget {
  const CupertinoListTileEg({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoListSection(
        header: const Text('My Reminders'),
        children: [
          CupertinoListTile(
            title: const Text('Open pull request'),
            leading: Container(
              width: double.infinity,
              height: double.infinity,
              color: CupertinoColors.activeGreen,
            ),
            trailing: const CupertinoListTileChevron(),
          ),
          CupertinoListTile(
            title: const Text('Push to master'),
            leading: Container(
              width: double.infinity,
              height: double.infinity,
              color: CupertinoColors.systemRed,
            ),
            additionalInfo: const Text('Not available'),
          ),
          CupertinoListTile(
            title: const Text("Title"),
            leading: Container(
              height: double.infinity,
              width: double.infinity,
              color: CupertinoColors.systemRed,
            ),
          )
        ],
      ),
    );
  }
}

class CupertinoFormSectionEg extends StatefulWidget {
  const CupertinoFormSectionEg({super.key});

  @override
  State<CupertinoFormSectionEg> createState() => _CupertinoFormSectionEgState();
}

class _CupertinoFormSectionEgState extends State<CupertinoFormSectionEg> {
  bool airplaneMode = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoFormSection(
      header: const Text('Connectivity'),
      children: [
        CupertinoFormRow(
          prefix: const Text("Select"),
          child: CupertinoSwitch(
            value: airplaneMode,
            onChanged: (bool value) {
              setState(() {
                airplaneMode = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

class CupertinoSearchTextFieldEg extends StatelessWidget {
  const CupertinoSearchTextFieldEg({
    super.key,
    required this.fieldValue,
  });

  final ValueChanged<String> fieldValue;

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      placeholder: 'Search',
      onChanged: (String value) {
        fieldValue('The text has changed to: $value');
      },
      onSubmitted: (String value) {
        fieldValue('Submitted text: $value');
      },
    );
  }
}

class CupertinoTabScaffoldEg extends StatelessWidget {
  const CupertinoTabScaffoldEg({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'Profile',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          if (index == 0) {
            return CupertinoTabView(
              builder: (context) {
                return const HomeTab();
              },
            );
          } else if (index == 1) {
            return CupertinoTabView(
              builder: (context) {
                return const SearchTab();
              },
            );
          } else if (index == 2) {
            return CupertinoTabView(
              builder: (context) {
                return const ProfileTab();
              },
            );
          }

          return CupertinoTabView(
            builder: (BuildContext context) {
              return Center(
                child: Text('Content of tab $index'),
              );
            },
          );
        });
  }
}

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Home"),
      ),
      child: Center(child: Text('Home')),
    );
  }
}

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Search"),
      ),
      child: Center(child: Text('Search')),
    );
  }
}

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Profile"),
      ),
      child: Center(child: Text('Profile')),
    );
  }
}

class MyFormEg extends StatefulWidget {
  const MyFormEg({super.key});

  @override
  State<MyFormEg> createState() => _MyFormEgState();
}

class _MyFormEgState extends State<MyFormEg> {
  final _formKey = GlobalKey<FormState>();
  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the name';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  maxLength: 15,
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(focus);
                  },
                  decoration: const InputDecoration(
                    labelText: "Name",
                    hintText: "Name",
                    // hintStyle: TextStyle(color: Colors.red),
                    helperText: "Enter name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const Divider(
                  height: 16,
                  color: Colors.transparent,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the mobile number';
                    } else if (value.length != 10) {
                      return 'Invalid mobile number';
                    }
                    return null;
                  },
                  focusNode: focus,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    labelText: "Mobile number",
                    hintText: "Mobile number",
                    // hintStyle: TextStyle(color: Colors.red),
                    helperText: "Enter mobile number",
                    prefixText: '+91',
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Submitted Data')),
                        );
                      }
                    },
                    child: const Text('Submit'))
              ],
            )),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'First page',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const Divider(
              height: 16,
              color: Colors.transparent,
            ),
            ElevatedButton(
                onPressed: () {
                  /*todo 1st way to navigate*/
                  /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondPage(data: 'Rahil'))
                  );*/

                  /*todo 2nd way to navigate*/
                  /*Navigator.pushNamed(context, '/secondPage');*/

                  /*todo 3rd way to navigate*/
                  Navigator.pushNamed(context, '/secondPage',
                      arguments: 'I came from first page');
                },
                child: const Text('Press here to navigate'))
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String data;

  const SecondPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Data: $data',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
