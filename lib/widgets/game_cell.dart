import 'package:flutter/material.dart';
import '../models/models.dart';

class GameCell extends StatelessWidget {
  final PlayerSymbol symbol;
  final int position;
  final VoidCallback onTap;

  const GameCell({
    Key? key,
    required this.symbol,
    required this.position,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            symbol == PlayerSymbol.x
                ? 'X'
                : symbol == PlayerSymbol.o
                    ? 'O'
                    : '',
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
