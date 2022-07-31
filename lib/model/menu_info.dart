import 'package:clock_app_sqflite/enum/enums.dart';

class MenuInfo{
  MenuType menuType;
  String title;
  String imageSource;
  MenuInfo(this.menuType, {required this.title,required this.imageSource});
}