import 'package:flutter/material.dart';
import 'package:nasa_demo/providers/nasa_provider.dart';
import 'package:nasa_demo/screens/homescreen.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(MyApp());
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<NasaProvider>(create: (_) => NasaProvider()),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
