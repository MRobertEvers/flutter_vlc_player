import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'multiple_tab.dart';
import 'single_tab.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';
import 'dart:developer' as developer;
void tt() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory directory = await getApplicationSupportDirectory();
  await for (var entity in directory.list(recursive: true, followLinks: false)) 
  {
    print(entity.path);
  }
}

void main() {
  tt();
  runApp(
    MaterialApp(
      home: App(),
    ),
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Vlc Player Example'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Single'),
              Tab(text: 'Multiple'),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            SingleTab(),
            MultipleTab(),
          ],
        ),
      ),
    );
  }
}
