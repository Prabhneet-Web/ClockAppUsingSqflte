import 'package:clock_app_sqflite/screens/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var now = DateTime.now();
    var formattedTime = DateFormat("HH:mm").format(now);
    var formattedDate = DateFormat("EEE, d MMM").format(now);
    var timeZoneString = now.timeZoneOffset.toString().split(".").first;
    var offsetSign = '';
    if (!timeZoneString.startsWith('-')) offsetSign = '+';
    print(timeZoneString);

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildMenuButton("Clock", "lib/assets/images/clock_icon.png"),
                buildMenuButton("Alarm", "lib/assets/images/alarm_icon.png"),
                buildMenuButton("Timer", "lib/assets/images/timer_icon.png"),
                buildMenuButton(
                    "Stopwatch", "lib/assets/images/stopwatch_icon.png")
              ],
            ),
            const VerticalDivider(
              color: Colors.white54,
              width: 1,
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Text(
                        "Clock",
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formattedTime,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 64,
                                fontFamily: "AvenirBlack"),
                          ),
                          Text(
                            formattedDate,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                     Flexible(
                        flex: 6,
                        fit: FlexFit.tight,
                        child: Align(
                            alignment: Alignment.center, child: ClockView(size: mediaQuery.size.height / 2.8,))),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "TimeZone",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.language, color: Colors.white),
                                const SizedBox(width: 16),
                                Text(
                                  "UTC $offsetSign $timeZoneString",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                )
                              ],
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildMenuButton(String title, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextButton(
          onPressed: () {},
          child: Column(
            children: [
              SizedBox(
                  height: 40,
                  child: Image.asset(
                    image,
                    scale: 1.5,
                  )),
              const Divider(height: 10),
              Text(title,
                  style: const TextStyle(color: Colors.white, fontSize: 14))
            ],
          )),
    );
  }
}
