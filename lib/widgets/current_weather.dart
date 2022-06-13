import 'package:animated_background/animated_background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:weatherapp/screens/home_page.dart';
import 'package:weatherapp/screens/profile_page.dart';

class CurrentWeather extends StatefulWidget {
  final Function() updateData;
  // ignore: use_key_in_widget_constructors
  const CurrentWeather(this.updateData);
  @override
  // ignore: library_private_types_in_public_api
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather>
    with TickerProviderStateMixin {
  bool searchBar = false;
  bool updating = false;
  var focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return GestureDetector(
      onTap: () {
        if (searchBar) {
          setState(() {
            searchBar = false;
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/delhi.png"),
            fit: BoxFit.contain,
            opacity: 0.7,
          ),
        ),
        height: MediaQuery.of(context).size.height / 1.5,
        child: Column(
          children: [
            Container(
              child: searchBar
                  ? TextField(
                      focusNode: focusNode,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: const Color(0xffffffff),
                          filled: true,
                          hintText: "Enter a city Name"),
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) async {
                        CityModel? temp = await fetchCity(value);
                        if (temp == null) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: const Color(0xff030317),
                                  title: const Text("City not found"),
                                  content:
                                      const Text("Please check the city name"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Ok"))
                                  ],
                                );
                              });
                          searchBar = false;
                          return;
                        }
                        city = temp.name.toString();
                        lat = temp.lat.toString();
                        lon = temp.lon.toString();
                        updating = true;
                        setState(() {});
                        widget.updateData();
                        searchBar = false;
                        updating = false;
                        setState(() {});
                      },
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          CupertinoIcons.wind_snow,
                          color: Colors.white,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                searchBar = true;
                                setState(() {});
                                focusNode.requestFocus();
                              },
                              child: Text(
                                "$city ",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 30),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                searchBar = true;
                                setState(() {});
                                focusNode.requestFocus();
                              },
                              child: const Icon(
                                CupertinoIcons.search,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Profile()));
                          },
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(user!.photoURL.toString()),
                            maxRadius: 25,
                          ),
                        ),
                      ],
                    ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${currentTemp!.current}\u00B0",
                  style: TextStyle(
                      height: 0.1,
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${currentTemp!.current}\u00B0",
                      style: TextStyle(
                          height: 0.1,
                          fontSize: 60,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(currentTemp!.name.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(currentTemp!.day.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ))
                  ],
                ),
                Text(
                  "${currentTemp!.current}\u00B0",
                  style: TextStyle(
                      height: 0.1,
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
