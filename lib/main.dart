import 'package:clock_app_sqflite/enum/enums.dart';
import 'package:clock_app_sqflite/model/menu_info.dart';
import 'package:clock_app_sqflite/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0XFF2D2F41),
          fontFamily: "AvenirRoman"
      ),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider <MenuInfo>(
          create: (context) => MenuInfo("Clock", "", menuType: MenuType.clock),
          child: const HomePage()),
    );
  }
}

