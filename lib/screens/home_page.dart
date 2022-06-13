import 'package:animated_background/animated_background.dart';
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
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
      backgroundColor: const Color(0xff030317),
      body: currentTemp == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : AnimatedBackground(
              behaviour: RacingLinesBehaviour(
                direction: LineDirection.Ttb,
                numLines: 130,
              ),
              vsync: this,
              // RandomParticleBehaviour(
              //   options: const ParticleOptions(
              //       spawnMaxRadius: 50,
              //       spawnMinRadius: 10,
              //       particleCount: 60,
              //       spawnMaxSpeed: 50,
              //       spawnMinSpeed: 20,
              //       minOpacity: 0.7,
              //       maxOpacity: 0.9,
              //       spawnOpacity: 0.4,
              //       baseColor: Colors.blue,
              //       image: Image(
              //         image: AssetImage('assets/rainy.png'),
              //       )),
              // ),
              // vsync: this,
              child: SafeArea(
                child: Stack(
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
              ),
            ),
    );
  }
}
