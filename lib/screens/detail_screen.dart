import 'package:flutter/material.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:weatherapp/widgets/next_days.dart';

class DetailPage extends StatelessWidget {
  final Weather tomorrowTemp;
  final List<Weather> sevenDay;
  // ignore: use_key_in_widget_constructors
  const DetailPage(this.tomorrowTemp, this.sevenDay);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030317),
      body: Column(
        children: [SevenDays(sevenDay)],
      ),
    );
  }
}
