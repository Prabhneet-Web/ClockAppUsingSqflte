import 'package:clock_app_sqflite/enum/enums.dart';
import 'package:flutter/material.dart';

class MenuInfo extends ChangeNotifier{
  MenuType menuType;
  String title;
  String imageSource;
  MenuInfo(this.title, this.imageSource , {required this.menuType});

  updateMenu(MenuInfo menuInfo){
    this.menuType = menuInfo.menuType;
    this.title = menuInfo.title;
    this.imageSource = menuInfo.imageSource;

    //Important
    notifyListeners();
  }


}