import 'package:ewalet_flutter_app/ui/completed_tab.dart';
import 'package:ewalet_flutter_app/ui/in_progress_tab.dart';
import 'package:flutter/material.dart';

import '../custom_view.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreen createState() {
    return _TransactionScreen();
  }
}

class _TransactionScreen extends State<TransactionScreen> with SingleTickerProviderStateMixin{
  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Scaffold(
        appBar: new AppBar(
          backgroundColor:  HexColor("#E64A19"),
          title: Center(child: Text("Transaction")),
          bottom: new TabBar(
              controller: controller,
              tabs: <Widget> [
                Tab(text: "Incomplete",),
                Tab(text: "Completed", )
              ]),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: <Widget>[
            InProgressTab(),
            CompletedTab()
          ],
        ),
      ),
    );
  }


}
