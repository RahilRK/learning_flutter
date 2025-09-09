import 'package:flutter/material.dart';
import 'package:learning_flutter/theme/color.dart';

class MyResponsiveApp extends StatelessWidget {
  const MyResponsiveApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyResponsiveApp',
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

      // home: const MediaQueryExample(),
      // home: const ExpandedExample(),
      // home: const LayoutBuilderExample(),
      // home: const WrapExample(),
      // home: const WrapExample(),
      // home: const GridViewExample(),
      // home: const FittedBoxExample(),
      // home: const AspectRatioExample(),
      home: const OrientationBuilderExample(),
    );
  }
}

class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('MediaQueryExample'),
      ),
      body: Row(
        children: [
          Container(
            width: screenWidth * 0.9,
            height: screenHeight * 0.2,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Responsive Box',
                style: TextStyle(
                    fontSize: screenWidth * 0.05, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpandedExample extends StatelessWidget {
  const ExpandedExample({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpandedExample'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: screenHeight * 0.5,
              color: Colors.orange,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: screenHeight * 0.5,
              color: Colors.blue,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: screenHeight * 0.5,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LayoutBuilderExample'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        if (screenWidth < 600) {
          return Center(
            child: Text('Mobile device'),
          );
        } else {
          return Center(
            child: Text('Tablet device'),
          );
        }
      }),
    );
  }
}

class WrapExample extends StatelessWidget {
  const WrapExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WrapExample'),
      ),
      body: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
              10,
              (i) => Chip(
                    label: Text(
                      'Cricket',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.blue,
                  ))),
    );
  }
}

class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridViewExample'),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, mainAxisSpacing: 5),
          itemCount: 50,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.blue[100 * ((index % 8) + 1)],
              child: Text("Item ${index + 1}"),
            );
          }),
    );
  }
}

class FittedBoxExample extends StatelessWidget {
  const FittedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FittedBox Example")),
      body: Center(
        child: Container(
          color: Colors.blue.shade100,
          width: 200, // Parent container size
          height: 100,
          child: FittedBox(
            fit: BoxFit.scaleDown, // Shrinks text if too big
            child: Text(
              "This is a very long text that fits",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

class AspectRatioExample extends StatelessWidget {
  const AspectRatioExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AspectRatio Example")),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9, // Always keep 16:9 ratio
          child: Container(
            color: Colors.purple.shade200,
            child: Center(
              child: Text(
                "16:9 Box",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OrientationBuilderExample extends StatelessWidget {
  const OrientationBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrientationBuilderExample'),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return const Center(child: Text('Portrait Mode'));
        } else {
          return const Center(child: Text('Landscape Mode'));
        }
      }),
    );
  }
}
