import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameBloc, GameState>(
      listener: (context, state) {
        if (state is GameWon) {
          _showGameOverDialog(
            context,
            'Ganador: ${state.winner == PlayerSymbol.x ? "Jugador 1 (X)" : "Jugador 2 (O)"}',
            state.winner,
          );
        } else if (state is GameDraw) {
          _showGameOverDialog(context, 'Empate', null);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Triqui'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<GameBloc, GameState>(
                builder: (context, state) {
                  String playerTurn = 'Jugador: ';
                  
                  if (state is GamePlaying) {
                    playerTurn +=
                        state.gameState.currentPlayer == PlayerSymbol.x
                            ? '1'
                            : '2';
                  } else if (state is GameWon) {
                    playerTurn =
                        'Ganador: ${state.winner == PlayerSymbol.x ? "1" : "2"}';
                  } else if (state is GameDraw) {
                    playerTurn = 'Empate';
                  }

                  return Text(
                    playerTurn,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              BlocBuilder<GameBloc, GameState>(
                builder: (context, state) {
                  if (state is GamePlaying) {
                    return GameBoard(
                      board: state.gameState.board,
                      onCellTap: (index) {
                        context.read<GameBloc>().add(CellTapped(index));
                      },
                    );
                  } else if (state is GameWon) {
                    return GameBoard(
                      board: state.gameState.board,
                      onCellTap: (_) {},
                    );
                  } else if (state is GameDraw) {
                    return GameBoard(
                      board: state.gameState.board,
                      onCellTap: (_) {},
                    );
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  context.read<GameBloc>().add(const GameReset());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  'Reiniciar Juego',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, String message,
      PlayerSymbol? winner) {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Juego Terminado'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }
}
