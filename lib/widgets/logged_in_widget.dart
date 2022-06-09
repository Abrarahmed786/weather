import 'package:flutter/material.dart';
import 'package:weatherapp/screens/home_page.dart';

class LoggedInWidget extends StatelessWidget {
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyHomePage());
  }
}
