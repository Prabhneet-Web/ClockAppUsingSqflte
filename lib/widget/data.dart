import 'package:clock_app_sqflite/enum/enums.dart';
import 'package:clock_app_sqflite/model/menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo("Clock", "lib/assets/images/clock_icon.png", menuType: MenuType.clock),
  MenuInfo("Alarm", "lib/assets/images/alarm_icon.png", menuType: MenuType.alarm),
  MenuInfo("Timer", "lib/assets/images/timer_icon.png", menuType: MenuType.timer),
  MenuInfo("Stopwatch", "lib/assets/images/stopwatch_icon.png", menuType: MenuType.stopwatch),
];