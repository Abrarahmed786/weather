import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/google_sign_in.dart';

class GoogleSignUpButtonWidget extends StatelessWidget {
  const GoogleSignUpButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            side: BorderSide(color: Colors.red),
          ),
        ),
      ),
      icon: const Padding(
        padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
        child: FaIcon(
          FontAwesomeIcons.google,
          size: 30,
          color: Colors.red,
        ),
      ),
      label: Text(
        'Continue with Google',
        style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.7)),
      ),
      onPressed: () {
        final provider =
            Provider.of<GoogleSignInProvider>(context, listen: false);
        provider.login();
      },
    );
  }
}
