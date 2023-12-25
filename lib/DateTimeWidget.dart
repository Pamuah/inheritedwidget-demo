import 'package:flutter/material.dart';
import 'package:inherited_widget/homepage.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final api = ApiProvider.of(context).api;
  return Text(api.dateAndTime??'Tap on Screen to fetch Date and Time');
  }
}