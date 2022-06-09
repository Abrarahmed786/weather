import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/provider/google_sign_in.dart';
import 'package:weatherapp/widgets/logged_in_widget.dart';
import 'package:weatherapp/widgets/signup_wodget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/736x/c1/9d/79/c19d7964360a0144b39a0e4b67ca2cfb.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: ChangeNotifierProvider(
            create: (context) => GoogleSignInProvider(),
            child: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                final provider = Provider.of<GoogleSignInProvider>(context);

                if (provider.isSigningIn) {
                  return buildLoading();
                } else if (snapshot.hasData) {
                  return const LoggedInWidget();
                } else {
                  return const SignUpWidget();
                }
              },
            ),
          ),
        ),
      );

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: const [
          Center(child: CircularProgressIndicator()),
        ],
      );
}
