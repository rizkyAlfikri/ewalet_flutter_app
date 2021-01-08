import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:ewalet_flutter_app/custom_view.dart';
import 'package:ewalet_flutter_app/ui/home_screen.dart';
import 'package:ewalet_flutter_app/ui/profile_screen.dart';
import 'package:ewalet_flutter_app/ui/spash_screen.dart';
import 'package:ewalet_flutter_app/ui/transaction_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: HexColor("#E64A19")));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  final titles = ["Main", 'Transaction', 'Profile'];
  final screen = [HomeScreen(), TransactionScreen(), ProfileScreen()];
  final colors = [Colors.deepOrange, Colors.indigoAccent, Colors.cyan];
  final icons = [
    CupertinoIcons.home,
    CupertinoIcons.news_solid,
    CupertinoIcons.profile_circled
  ];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController;
  MenuPositionController _menuPositionController;
  bool _userPageDrawing = false;

  @override
  void initState() {
    _menuPositionController = MenuPositionController(initPosition: 0);

    _pageController =
        PageController(initialPage: 0, keepPage: false, viewportFraction: 1.0);
    _pageController.addListener(handlePageChange);

    super.initState();
  }

  void handlePageChange() {
    _menuPositionController.absolutePosition = _pageController.page;
  }

  void checkUserDragging(ScrollNotification scrollNotification) {
    if (scrollNotification is UserScrollNotification &&
        scrollNotification.direction != ScrollDirection.idle) {
      _userPageDrawing = true;
    } else if (scrollNotification is ScrollEndNotification) {
      _userPageDrawing = false;
    }

    if (_userPageDrawing) {
      _menuPositionController.findNearestTarget(_pageController.page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            checkUserDragging(scrollNotification);
          },
          child: PageView(
            controller: _pageController,
            children: widget.screen
                .map((Widget screen) => Container(
                      child: screen,
                    ))
                .toList(),
            onPageChanged: (page) {},
          ),
        ),
        bottomNavigationBar: BubbledNavigationBar(
          controller: _menuPositionController,
          initialIndex: 0,
          itemMargin: EdgeInsets.symmetric(horizontal: 8.0),
          backgroundColor: Colors.white,
          defaultBubbleColor: Colors.blue,
          onTap: (index) {
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOutQuad);
          },
          items: widget.titles.map((title) {
            var index = widget.titles.indexOf(title);
            var color = widget.colors[index];
            return BubbledNavigationBarItem(
                icon: getIcon(index, color),
                activeIcon: getIcon(index, Colors.white),
                bubbleColor: color,
                title: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ));
          }).toList(),
        ),
      ),
    );
  }

  Padding getIcon(int index, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: Icon(
        widget.icons[index],
        size: 30,
        color: color,
      ),
    );
  }
}
