import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/provider/google_sign_in.dart';
import 'package:weatherapp/widgets/app_bar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        title: const MyAppBar(),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Text(
            user!.displayName.toString(),
            style: GoogleFonts.lato(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CircleAvatar(
            maxRadius: 60,
            backgroundImage: NetworkImage(
              user.photoURL.toString(),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Divider(),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.person_outline,
                size: 30,
                color: Color.fromARGB(255, 185, 146, 192),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                user.displayName.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.email_outlined,
                size: 30,
                color: Color.fromARGB(255, 185, 146, 192),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                user.email.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.phone_outlined,
                size: 30,
                color: Color.fromARGB(255, 185, 146, 192),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                user.phoneNumber.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ],
          ),
          const Divider(),
          const Spacer(),
          OutlinedButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            style: OutlinedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            child: Text(
              'Logout',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
