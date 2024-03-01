import 'package:flutter/material.dart';
import 'package:learning_flutter/abstractEg.dart';
import 'package:learning_flutter/encapsulation.dart';
import 'package:learning_flutter/inheritanceEg.dart';
import 'package:learning_flutter/interfaceEg.dart';
import 'package:learning_flutter/overridingEg.dart';
import 'package:learning_flutter/simpleConstructorEg.dart';

import 'async_await.dart';
import 'simpleClassEg.dart';

void main() {
  // runApp(const MyApp());
  // callSimpleStudentClass();
  // callCarClass();
  // callDogClass();
  // callEagleClass();
  // callRectangleClass();
  // callListClass();
  // callStudentPercentage();
  // print(10.getNumberInWords());
  testApiCall();
}

void testApiCall() {
  var asyncAwaitClass = AsyncAwaitClass();
  asyncAwaitClass.execute();
}

void callSimpleStudentClass() {
  var student1 = Student();
  student1.rollNumber = 1;
  student1.name = "Rahil";
  student1.studentDetail();

  var student2 = Student();
  student2.rollNumber = 2;
  student2.name = "Sameer";
  student2.studentDetail();

  var student3 = Student();
  student3.rollNumber = 3;
  student3.name = "Jasmin";
  student3.studentDetail();
}

void callCarClass() {
  /*var car = Car();
  car.name = "Audi";
  car.topSpeed = 100;
  car.carDetail();*/

  /*var car1 = Car(name: "Audi", topSpeed: 100);
  car1.carDetail();
  var car2 = Car(name: "BMW", topSpeed: 200);
  car2.carDetail();
  var car3 = Car(name: "Mercedes", topSpeed: 300);
  car3.carDetail();*/

  /*var car = Car.myNamedConstructor1();
  var car1 = Car.myNamedConstructor2(name: "Audi", topSpeed: 100);
  car1.carDetail();
  var car2 = Car.myNamedConstructor2(name: "BMW", topSpeed: 200);
  car2.carDetail();*/
}

void callDogClass() {
  var dog = Dog();
  dog.name = "Husky";
  dog.age = 3;
  dog.bark();

  var cat = Cat();
  cat.name = "Snowy";
  cat.breed = "Persian";
  cat.meow();
}

void callEagleClass() {
  var eagle = Eagle();
  eagle.fly();
}

void callRectangleClass() {
  var rectangle = Rectangle();
  rectangle.draw();

  var circle = Circle();
  circle.draw();
}

void callListClass() {
  var list = List();
  list.clickOne();
  list.clickTwo();
}

void callStudentPercentage() {
  var studentPercentage = StudentPercentage();
  studentPercentage.calculatePercentage = 250;
  print(studentPercentage.percentage);
}

/*todo simple extension function */
extension on int {
  getNumberInWords() {
    if (this == 1) {
      return "One";
    } else if (this == 2) {
      return "Two";
    } else if (this == 3) {
      return "Three";
    } else {
      return "Error occured";
    }
  }
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
