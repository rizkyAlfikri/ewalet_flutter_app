import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

int selectedIndex = 0;

class CustomIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 185,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.phone_android,
                                color: HexColor('#273CD6'),
                              ),
                              padding: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.white,
                                        HexColor('#273CD6')
                                      ],
                                      begin: Alignment(0.0, 0.0),
                                      end: Alignment(0.0, 1.0))),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "Mobile\nCharge",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.healing,
                              color: HexColor('#38A732'),
                            ),
                            padding: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    colors: [Colors.white, HexColor('#38A732')],
                                    begin: Alignment(0.0, 0.0),
                                    end: Alignment(0.0, 1.0))),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "Assurance",
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: new SvgPicture.asset(
                              'assets/icons/game.svg',
                              height: 24.0,
                              width: 24.0,
                              color: HexColor('#AF1130'),
                            ),
                            padding: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    colors: [Colors.white, HexColor('#AF1130')],
                                    begin: Alignment(0.0, 0.0),
                                    end: Alignment(0.0, 1.0))),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "Games",
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.invert_colors,
                                color: HexColor('#039BE5'),
                              ),
                              padding: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.white,
                                        HexColor('#039BE5')
                                      ],
                                      begin: Alignment(0.0, 0.0),
                                      end: Alignment(0.0, 1.0))),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "Water",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.language,
                              color: HexColor('#5011B0'),
                            ),
                            padding: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    colors: [Colors.white, HexColor('#5011B0')],
                                    begin: Alignment(0.0, 0.0),
                                    end: Alignment(0.0, 1.0))),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "Internet",
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.lightbulb_outline,
                              color: HexColor('#FDD835'),
                            ),
                            padding: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    colors: [Colors.white, HexColor('#FDD835')],
                                    begin: Alignment(0.0, 0.0),
                                    end: Alignment(0.0, 1.0))),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "PLN",
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.live_tv,
                              color: HexColor('#FF9800'),
                            ),
                            padding: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    colors: [Colors.white, HexColor('#FF9800')],
                                    begin: Alignment(0.0, 0.0),
                                    end: Alignment(0.0, 1.0))),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "Tv Cable",
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.more_horiz,
                                color: HexColor('#838383'),
                              ),
                              padding: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.white,
                                        HexColor('#838383')
                                      ],
                                      begin: Alignment(0.0, 0.0),
                                      end: Alignment(0.0, 1.0))),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "More",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final List<BubbledNavigationBarItem> bottomNavigationItems = [
  BubbledNavigationBarItem(
      icon: Icon(
        CupertinoIcons.home,
        size: 30,
        color: Colors.blue,
      ),
      activeIcon: Icon(
        CupertinoIcons.home,
        size: 30,
        color: Colors.white,
      ),
      title: Text(
        'Home',
        style: TextStyle(color: Colors.white, fontSize: 12.0),
      )),
  BubbledNavigationBarItem(
      icon: Icon(
        Icons.assignment,
        size: 30,
        color: Colors.green,
      ),
      activeIcon: Icon(
        Icons.assignment,
        size: 30,
        color: Colors.white,
      ),
      title: Text(
        'History',
        style: TextStyle(color: Colors.white, fontSize: 12.0),
      )),
  BubbledNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/scanner_code.svg',
        width: 30.0,
        height: 30.0,
        color: HexColor('#273CD6'),
      ),
      activeIcon:SvgPicture.asset(
        'assets/icons/scanner_code.svg',
        width: 30.0,
        height: 30.0,
        color: Colors.white,
      ),
      title: Text(
        'QRIS',
        style: TextStyle(color: Colors.white, fontSize: 12.0),
      )),
  BubbledNavigationBarItem(
      icon: Icon(
        Icons.person_pin_circle,
        size: 30,
        color: Colors.deepOrangeAccent,
      ),
      activeIcon: Icon(
        Icons.person_pin_circle,
        size: 30,
        color: Colors.white,
      ),
      title: Text(
        'Merchant',
        style: TextStyle(color: Colors.white, fontSize: 12.0),
      )),
  BubbledNavigationBarItem(
      icon: Icon(
        CupertinoIcons.profile_circled,
        size: 30,
        color: Colors.indigo,
      ),
      activeIcon: Icon(
        CupertinoIcons.profile_circled,
        size: 30,
        color: Colors.white,
      ),
      title: Text(
        'Profile',
        style: TextStyle(color: Colors.white, fontSize: 12.0),
      ))
];

class CustomBottomAppBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomBottomAppBar();
  }
}

class _CustomBottomAppBar extends State<CustomBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      child: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Column(
                children: [Icon(Icons.home), Text("Home")],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [Icon(Icons.home), Text("Home")],
              ),
            )
          ],
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

class FABBottomAppBarItem {
  FABBottomAppBarItem({this.iconData, this.text});

  IconData iconData;
  String text;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    this.items,
    this.centerItemText,
    this.height: 60.0,
    this.iconSize: 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }

  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(color: widget.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    FABBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color = selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Text(
                  item.text,
                  style: TextStyle(color: color),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
