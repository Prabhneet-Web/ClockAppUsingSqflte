import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  final double size;
  const ClockView({Key? key, required this.size}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {

  @override
  void initState(){
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(mounted) {
        setState((){});
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: Transform.rotate(
          angle: -pi / 2,
          child: CustomPaint(
            painter: ClockPainter(),
          ),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  //60sec - 360, 1sec - 360/60
  //12 hours  - 360, 1 hour - 30degrees, 1 min - 0.5degrees


  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = const Color(0XFF444974);

    var outlineBrush = Paint()
      ..color = const Color(0XFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 20;

    var centerFillBrush = Paint()
      ..color = const Color(0XFFEAECFF);

    var secondHandBrush = Paint()
      ..color = Colors.orange.shade300
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = size.width / 60;

    var minHandBrush = Paint()
      ..shader = const RadialGradient(colors: [Color(0XFF748EF6), const Color(0XFF77DDFF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 30;

    var hourHandBrush = Paint()
      ..shader = const RadialGradient(colors: [Color(0xFFEA74AB), Color(0XFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 24;

    var dashBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    canvas.drawCircle(center, radius * 0.75, fillBrush);
    canvas.drawCircle(center, radius * 0.75, outlineBrush);

    var hourHandX = centerX + radius * 0.4 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerY + radius * 0.4 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + radius * 0.5 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerY + radius * 0.5 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var secHandX = centerX + radius * 0.7 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerY + radius * 0.7 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secondHandBrush);

    canvas.drawCircle(center, radius * 0.12, centerFillBrush);


    var outerCircleRadius = radius;
    var innerCircleRadius = radius *0.9;

    for(double i = 0; i < 360; i+=12){

      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerY + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerY + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);

     }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
