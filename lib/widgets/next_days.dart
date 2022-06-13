import 'package:flutter/material.dart';
import 'package:weatherapp/model/weather_model.dart';

class SevenDays extends StatelessWidget {
  final List<Weather> sevenDay;
  // ignore: use_key_in_widget_constructors
  const SevenDays(this.sevenDay);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: ListView.builder(
            itemCount: sevenDay.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(sevenDay[index].day.toString(),
                          style: const TextStyle(fontSize: 20)),
                      SizedBox(
                        width: 135,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image(
                              image:
                                  AssetImage(sevenDay[index].image.toString()),
                              width: 40,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              sevenDay[index].name.toString(),
                              style: const TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "+${sevenDay[index].max}\u00B0",
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "+${sevenDay[index].min}\u00B0",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ));
            }),
      ),
    );
  }
}
