import 'package:clock_app_sqflite/screens/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var now = DateTime.now();
    var formattedTime = DateFormat("HH:mm").format(now);
    var formattedDate = DateFormat("EEE, d MMM").format(now);
    var timeZoneString = now.timeZoneOffset.toString().split(".").first;
    var offsetSign = '';
    if (!timeZoneString.startsWith('-')) offsetSign = '+';

    return Container(
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
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
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
                  alignment: Alignment.center,
                  child: ClockView(
                    size: mediaQuery.size.height / 2.8,
                  ))),
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
    );
  }
}
