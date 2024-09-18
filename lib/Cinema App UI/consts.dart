import 'package:flutter/material.dart';

const appBackgroundColor = Color(0xFF1c1c27);
const grey = Color(0xFF373741);
const buttonColor = Color(0xFFffb43b);

// for time

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String digitHours = duration.inHours.remainder(60).toString();
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  return "${digitHours}h ${twoDigitMinutes}m";
}
// it display the time in format just like hour  minut and second