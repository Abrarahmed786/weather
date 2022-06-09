import "package:flutter/material.dart";
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:weatherapp/widgets/current_weather.dart';
import 'package:weatherapp/widgets/next_days.dart';

Weather? currentTemp;
Weather? tomorrowTemp;
List<Weather>? todayWeather;
List<Weather>? sevenDay;
String lat = "26.9124";
String lon = "75.7873";
String city = "Jaipur";
bool searchBar = false;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  getData() async {
    fetchData(lat, lon, city).then((value) {
      currentTemp = value[0];
      todayWeather = value[1];
      tomorrowTemp = value[2];
      sevenDay = value[3];
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff030317),
      body: currentTemp == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                CurrentWeather(getData),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 600,
                  ),
                  child: ClipPath(
                    clipper: WaveClipperOne(reverse: true),
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: SevenDays(sevenDay!),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
