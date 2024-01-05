import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_api/view/main_page.dart';
import 'package:rick_and_morty_api/view_model/main_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:  ChangeNotifierProvider(
        create: (context) => MainViewModel(),
        child:const  MainPage(),
      ),
    );
  }
}
