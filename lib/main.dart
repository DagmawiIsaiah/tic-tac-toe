import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/screens.dart';
import '../custom_theme.dart';
import '../logic/game_logic.dart';

void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GameLogic(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.customTheme,
        title: 'Tic Tac Toe',
        initialRoute: PlayModeScreen.routeName,
        routes: {
          GameScreen.routeName: (context) => const GameScreen(),
          ChooseSideScreen.routeName: (context) => const ChooseSideScreen(),
          PlayModeScreen.routeName: (context) => const PlayModeScreen(),
        },
      ),
    );
  }
}
