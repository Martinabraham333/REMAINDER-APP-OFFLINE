import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

   Future<DateTime> selectDateTime(BuildContext context) async {
   TimeOfDay? pickedTime ;
   DateTime? pickedDate;
    pickedDate = await showDatePicker(
    context: context,
    firstDate: DateTime(2000),
    lastDate: DateTime(3000),
  );

  if (pickedDate != null) {
    pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
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
