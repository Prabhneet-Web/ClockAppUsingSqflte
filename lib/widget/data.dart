import 'package:clock_app_sqflite/assets/colors/theme_data.dart';
import 'package:clock_app_sqflite/enum/enums.dart';
import 'package:clock_app_sqflite/model/alarm_info.dart';
import 'package:clock_app_sqflite/model/menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(title: "Clock", imageSource: "lib/assets/images/clock_icon.png", menuType: MenuType.clock),
  MenuInfo(title: "Alarm", imageSource: "lib/assets/images/alarm_icon.png", menuType: MenuType.alarm),
  MenuInfo(title: "Timer", imageSource: "lib/assets/images/timer_icon.png", menuType: MenuType.timer),
  MenuInfo(title: "Stopwatch", imageSource: "lib/assets/images/stopwatch_icon.png", menuType: MenuType.stopwatch),
];

List<AlarmInfo> alarms = [
  AlarmInfo(alarmDateTime: DateTime.now().add(Duration(hours: 1)), description: "Office", gradientColor: GradientColors.sky),
  AlarmInfo(alarmDateTime: DateTime.now().add(Duration(hours: 1)), description: "Office", gradientColor: GradientColors.fire),

];