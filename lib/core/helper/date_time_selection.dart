import 'package:flutter/material.dart';

selectDateTime(BuildContext context) async {
  DateTime? pickDate = await showDatePicker(
    context: context,
    firstDate: DateTime(2000),
    lastDate: DateTime(3000),
  );

  if (pickDate != null) {
    TimeOfDay? pickTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }
}
