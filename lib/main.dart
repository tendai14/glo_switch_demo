import 'package:flutter/material.dart';
import 'package:glow_switch/app_blocs.dart';
import 'package:glow_switch/app_repositories.dart';
import 'package:glow_switch/ui/posts_page.dart';

Future<void> main() async {
  var config = const AppRepositories(
    appBlocs: AppBlocs(
      app: MyApp(),
    ),
  );

  runApp(config);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'GloSwitch',
      home: Posts(),
      debugShowCheckedModeBanner: false,
    );
  }
}
