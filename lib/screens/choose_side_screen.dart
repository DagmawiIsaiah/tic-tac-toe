import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/logic/game_logic.dart';
import 'package:provider/provider.dart';

import '../screens/screens.dart';

enum Side {
  x,
  o,
}

class ChooseSideScreen extends StatefulWidget {
  static const routeName = '/choose-side-screen';
  const ChooseSideScreen({super.key});

  @override
  State<ChooseSideScreen> createState() => _ChooseSideScreenState();
}

class _ChooseSideScreenState extends State<ChooseSideScreen> {
  Side currentSide = Side.o;

  void changeSide(Side side) {
    setState(() {
      currentSide = side;
    });
  }

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              "Choose a side",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            sideCard(Side.o),
            sideCard(Side.x),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(GameScreen.routeName);
              },
              child: const Text("Start game"),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget sideCard(Side side) {
    return InkWell(
      onTap: () {
        changeSide(side);
        String player = (side == Side.x) ? 'X' : 'O';
        context.read<GameLogic>().setCurrentPlayer(player);
      },
      child: Container(
        decoration: BoxDecoration(
          color: (currentSide == side) ? Colors.white : null,
          borderRadius: BorderRadius.circular(30),
        ),
        height: 150,
        width: 150,
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
        child: SizedBox(
          height: 50,
          child: (side == Side.o)
              ? SvgPicture.asset(
                  "assets/icons/o.svg",
                  color: (currentSide == side)
                      ? Color.fromARGB(255, 112, 75, 206)
                      : Colors.white,
                )
              : SvgPicture.asset(
                  "assets/icons/x.svg",
                  color: (currentSide == side)
                      ? Color.fromARGB(255, 112, 75, 206)
                      : Colors.white,
                ),
        ),
      ),
    );
  }
}
