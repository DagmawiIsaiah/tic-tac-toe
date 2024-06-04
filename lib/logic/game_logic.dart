import 'package:flutter/material.dart';

class GameLogic with ChangeNotifier {
  List<String> cells =
      List.generate(9, (_) => ''); // List to store cell values (X, O, or empty)
  String currentPlayer = 'O';
  late String selectedSide;
  int scoreX = 0;
  int scoreO = 0;

  void setCurrentPlayer(String player) {
    selectedSide = player;
    currentPlayer = player;
  }

  // Function to handle a cell tap
  void onCellTapped(int index, context) {
    if (cells[index] == '') {
      cells[index] = currentPlayer;
      // Check for winner or tie after each move
      checkWinner(context);
      currentPlayer = currentPlayer == 'X' ? 'O' : 'X'; // Switch player
    }
    notifyListeners();
  }

  void resetGame() {
    cells = List.generate(9, (_) => ''); // Reset all cells to empty
    currentPlayer = selectedSide; // Start with player X again
    notifyListeners();
  }

  // Function to check for winner
  void checkWinner(context) {
    final winningConditions = [
      [0, 1, 2], // Row 1
      [3, 4, 5], // Row 2
      [6, 7, 8], // Row 3
      [0, 3, 6], // Column 1
      [1, 4, 7], // Column 2
      [2, 5, 8], // Column 3
      [0, 4, 8], // Diagonal 1
      [2, 4, 6], // Diagonal 2
    ];

    for (var condition in winningConditions) {
      if (cells[condition[0]] == currentPlayer &&
          cells[condition[1]] == currentPlayer &&
          cells[condition[2]] == currentPlayer) {
        // Winner found!
        if (currentPlayer == 'X') {
          scoreX++;
        } else {
          scoreO++;
        }

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Winner!'),
              content: Text('$currentPlayer wins!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    resetGame(); // Call a function to reset the game
                  },
                  child: const Text('Play Again'),
                ),
              ],
            );
          },
        );
      }
    }

    // Check for tie (all cells filled but no winner)
    if (!cells.contains('')) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('It\'s a Tie!'),
            content: const Text('The game has ended in a tie.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  resetGame(); // Call a function to reset the game
                },
                child: const Text('Play Again'),
              ),
            ],
          );
        },
      );
    }
  }
}
