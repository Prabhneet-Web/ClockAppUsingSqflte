import 'package:flutter/material.dart';

class AlarmInfo{
  DateTime alarmDateTime;
  String description;
  bool isActive;
  List<Color> gradientColor;

  AlarmInfo({required this.alarmDateTime, this.description = "", this.isActive = false, required this.gradientColor});
}