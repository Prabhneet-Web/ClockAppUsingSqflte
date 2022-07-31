import 'package:clock_app_sqflite/assets/colors/theme_data.dart';
import 'package:clock_app_sqflite/widget/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Alarm",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView(
                children: alarms.map<Widget>((alarm) {
              return Container(
                margin: const EdgeInsets.only(bottom: 32),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: alarm.gradientColor.last.withOpacity(0.4),
                          blurRadius: 8,
                          spreadRadius: 1,
                          offset: Offset(4, 4))
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    gradient: LinearGradient(
                        colors: alarm.gradientColor,
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.label,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Office",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Switch(
                          value: true,
                          onChanged: (bool value) {},
                          activeColor: Colors.white,
                        )
                      ],
                    ),
                    const Text(
                      "Mon-Fri",
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "07:00 AM",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 24),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 36,
                          color: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
              );
            }).followedBy([
              DottedBorder(
                strokeWidth: 3,
                color: CustomColors.clockOutline,
                borderType: BorderType.RRect,
                radius: Radius.circular(24),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CustomColors.clockBG,
                    borderRadius: const BorderRadius.all(Radius.circular(24))
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                      Image.asset(
                            "lib/assets/images/add_alarm.webp",
                            scale: 10,
                          ),

                        const SizedBox(height: 8),
                        Text(
                          "Add Alarm",
                          style: TextStyle(color: CustomColors.primaryTextColor),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]).toList()),
          )
        ],
      ),
    );
  }
}
