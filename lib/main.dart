import 'package:flutter/material.dart';
import 'package:mcd/screens/login/loginPage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mcd/screens/MainHome/MainHome.dart';
import 'package:provider/provider.dart';


void main() {

  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Custom Diary',
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // LoginPage로 이동
    );
  }
}



