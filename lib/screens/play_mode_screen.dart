import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/screens.dart';

class PlayModeScreen extends StatelessWidget {
  static const routeName = '/play-mode-screen';
  const PlayModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 169, 105, 227),
              Color.fromARGB(255, 112, 75, 206),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  child: SvgPicture.asset(
                    "assets/icons/o.svg",
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: SvgPicture.asset(
                    "assets/icons/x.svg",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              "Choose a play mode",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ChooseSideScreen.routeName);
                },
                child: Text("With AI"),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(ChooseSideScreen.routeName);
                },
                child: Text("With a friend"),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
