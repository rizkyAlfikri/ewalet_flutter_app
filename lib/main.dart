import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:ewalet_flutter_app/custom_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedTab = 0;
  var pages = PageView.builder(itemBuilder: (context, _selectedTab) {
    return widgets[_selectedTab];
  });

  void onTabTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        bottomNavigationBar: BubbledNavigationBar(
          controller: MenuPositionController(initPosition: _selectedTab),
          defaultBubbleColor: Colors.blue,
          onTap: onTabTapped,
          items: bottomNavigationItems,
        ),
        body: Center(
            child: IndexedStack(
          index: _selectedTab,
          children: widgets,
        )));
  }
}

List<Widget> widgets = [
  Text("pertama"),
  Text("Kedua"),
  Text("Ketiga"),
  Text("Keempat"),
  Text("Lima")
];
