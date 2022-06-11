import 'package:flutter/material.dart';
import 'package:weatherapp/model/weather_model.dart';

class WeatherWidget extends StatelessWidget {
  final Weather weather;
  // ignore: use_key_in_widget_constructors
  const WeatherWidget(this.weather);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(width: 0.2, color: Colors.white),
          borderRadius: BorderRadius.circular(35)),
      child: Column(
        children: [
          Text(
            "${weather.current}\u00B0",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          Image(
            image: AssetImage(weather.image.toString()),
            width: 50,
            height: 50,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            weather.time.toString(),
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
