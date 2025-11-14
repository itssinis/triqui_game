import 'package:flutter/material.dart';
import '../models/models.dart';
import 'game_cell.dart';

class GameBoard extends StatelessWidget {
  final List<PlayerSymbol> board;
  final Function(int) onCellTap;

  const GameBoard({
    Key? key,
    required this.board,
    required this.onCellTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return GameCell(
          symbol: board[index],
          position: index,
          onTap: () => onCellTap(index),
        );
      },
    );
  }
}
