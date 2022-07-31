import 'package:clock_app_sqflite/enum/enums.dart';
import 'package:clock_app_sqflite/model/menu_info.dart';
import 'package:clock_app_sqflite/view/alarm_page.dart';
import 'package:clock_app_sqflite/view/clock_page.dart';
import 'package:clock_app_sqflite/widget/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // var mediaQuery = MediaQuery.of(context);
    // var now = DateTime.now();
    // var formattedTime = DateFormat("HH:mm").format(now);
    // var formattedDate = DateFormat("EEE, d MMM").format(now);
    // var timeZoneString = now.timeZoneOffset.toString().split(".").first;
    // var offsetSign = '';
    // if (!timeZoneString.startsWith('-')) offsetSign = '+';
    // print(timeZoneString);

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: menuItems
                    .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                    .toList()),
            const VerticalDivider(
              color: Colors.white54,
              width: 1,
            ),
            Expanded(
              child: Consumer<MenuInfo>(
                builder: (BuildContext context, MenuInfo value, Widget? child){
                  if(value.menuType == MenuType.clock) {
                    return const ClockPage();
                  }
                  else if(value.menuType == MenuType.alarm){
                    return const AlarmPage();
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Consumer<MenuInfo>(
        builder: (BuildContext context, MenuInfo value, Widget? child) {
          return TextButton(
              onPressed: () {
                var menuInfo = Provider.of<MenuInfo>(context, listen: false);
                menuInfo.updateMenu(currentMenuInfo);
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25)))),
                  backgroundColor: currentMenuInfo.menuType == value.menuType
                      ? MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 34, 35, 49))
                      : MaterialStateProperty.all<Color>(Colors.transparent)),
              child: Column(
                children: [
                  SizedBox(
                      height: 40,
                      child: Image.asset(
                        currentMenuInfo.imageSource,
                        scale: 1.5,
                      )),
                  const Divider(height: 10),
                  Text(currentMenuInfo.title,
                      style: const TextStyle(color: Colors.white, fontSize: 14))
                ],
              ));
        },
      ),
    );
  }
}
