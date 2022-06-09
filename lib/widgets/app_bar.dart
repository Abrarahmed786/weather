import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/google_sign_in.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Column(
      children: [
        Row(
          children: const [
            SizedBox(width: 10),
            Icon(
              Icons.wind_power_outlined,
              color: Colors.black,
            ),
            SizedBox(width: 10),
            Text(
              'Weather',
              style: TextStyle(color: Colors.black),
            ),
            Spacer(),
            Icon(
              Icons.analytics_outlined,
              color: Colors.black,
            ),
            SizedBox(width: 10),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL.toString()),
              maxRadius: 25,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              '${user.displayName}\n${user.email}',
              style: const TextStyle(color: Colors.black),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              icon: const Icon(Icons.logout),
              color: Colors.black,
            )
          ],
        )
      ],
    );
  }
}
