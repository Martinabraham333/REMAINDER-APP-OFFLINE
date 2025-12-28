import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remainder_app_offline/core/constants/app_colors.dart';

Future<DateTime> selectDateTime(BuildContext context) async {
  TimeOfDay? pickedTime;
  DateTime? pickedDate;
  pickedDate = await showDatePicker(
    context: context,
    firstDate: DateTime(2000),
    lastDate: DateTime(3000),
    builder: styleBuilder,
  );

  if (pickedDate != null) {
    pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: styleBuilder,
    );
  }


  return DateTime(
    pickedDate!.year,
    pickedDate.month,
    pickedDate.day,
    pickedTime!.hour,
    pickedTime.minute,
  );
}

Widget styleBuilder(BuildContext context, Widget? child) {
  return Theme(
    data: Theme.of(context).copyWith(
      primaryColor: AppColors.primaryColor,

      colorScheme: ColorScheme.light(
        onPrimary: Colors.black,
        primary: Colors.white,
        onSurface: Colors.black,
        surface: AppColors.primaryColor,
      ),
      timePickerTheme: TimePickerThemeData(
        dayPeriodColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white; // selected AM/PM
          }
          return AppColors.primaryColor; // unselected AM/PM
        }),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: Colors.black),
      ),
    ),
    child: child!,
  );
}
