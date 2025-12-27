import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String dateTimeConvertor(DateTime date){
String formattedDate= DateFormat('dd MMM yyyy hh:mm a').format(date);
return formattedDate;
}
