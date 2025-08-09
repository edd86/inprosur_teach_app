import 'package:flutter/material.dart';

class Utils {
  String getUsernameByGoogle(String userName) => userName.split(' ')[0];
  String timeToString(TimeOfDay duration) =>
      '${duration.hour}:${duration.minute < 10 ? '0${duration.minute}' : duration.minute.toString()}';
}
