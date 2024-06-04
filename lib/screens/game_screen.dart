import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../logic/game_logic.dart';
import '../screens/screens.dart';

class GameScreen extends StatelessWidget {
  static const routeName = '/game-screen';
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "X",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Text(
                      "${context.read<GameLogic>().scoreX} - ${context.read<GameLogic>().scoreO}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: const Color.fromARGB(255, 112, 75, 206),
                          ),
                    ),
                  ),
                  Text(
                    "O",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // GridView to display the Tic Tac Toe board
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    height: size.width - 80,
                    width: size.width - 80,
                    child: Row(
                      children: [
                        const Spacer(),
                        Container(
                          height: size.width - 80,
                          width: 10,
                          color: Colors.white,
                        ),
                        const Spacer(),
                        Container(
                          height: size.width - 80,
                          width: 10,
                          color: Colors.white,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.width - 80,
                    width: size.width - 80,
                    child: Column(
                      children: [
                        const Spacer(),
                        Container(
                          height: 10,
                          width: size.width - 80,
                          color: Colors.white,
                        ),
                        const Spacer(),
                        Container(
                          height: 10,
                          width: size.width - 80,
                          color: Colors.white,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.width - 40,
                    width: size.width - 80,
                    child: GridView.count(
                      shrinkWrap: true, // Wrap content vertically
                      crossAxisCount: 3, // 3 cells per row
                      children: List.generate(context.watch<GameLogic>().cells.length, (index) {
                        return GestureDetector(
                          onTap: () => context.read<GameLogic>().onCellTapped(index, context),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white.withOpacity(0), width: 1),
                            ),
                            child: Center(
                              child: (context.watch<GameLogic>().cells[index] == 'X')
                                  ? SizedBox(
                                      height: 40,
                                      child: SvgPicture.asset(
                                        "assets/icons/x.svg",
                                        color: Colors.white,
                                      ),
                                    )
                                  : (context.watch<GameLogic>().cells[index] == 'O')
                                      ? SizedBox(
                                          height: 40,
                                          child: SvgPicture.asset(
                                            "assets/icons/o.svg",
                                            color: Colors.white,
                                          ),
                                        )
                                      : Text(context.watch<GameLogic>().cells[index]),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  context.read<GameLogic>().resetGame();
                  context.read<GameLogic>().scoreO = 0;
                  context.read<GameLogic>().scoreX = 0;
                  Navigator.of(context)
                      .pushReplacementNamed(PlayModeScreen.routeName);
                },
                child: const Text("End game"),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
