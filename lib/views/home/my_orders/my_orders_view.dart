import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("طلباتي"),
            bottom:  TabBar(tabs: [Text("الحاليه", style: TextStyle(color: Theme.of(context).primaryColor),), Text("المنتهية", style: TextStyle(color: Theme.of(context).primaryColor),)]),
          ),
          body: const TabBarView(
            children: [
              // Content of Tab 1
              Center(
                child: Text('Tab 1 Content'),
              ),

              // Content of Tab 2
              Center(
                child: Text('Tab 2 Content'),
              ),
            ],
          )),
    );
  }
}
