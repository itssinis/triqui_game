import 'package:equatable/equatable.dart';
import '../models/models.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object?> get props => [];
}

class GameInitial extends GameState {
  const GameInitial();
}

class GamePlaying extends GameState {
  final GameStateModel gameState;

  const GamePlaying(this.gameState);

  @override
  List<Object?> get props => [gameState];
}

class GameWon extends GameState {
  final GameStateModel gameState;
  final PlayerSymbol winner;

  const GameWon(this.gameState, this.winner);

  @override
  List<Object?> get props => [gameState, winner];
}

class GameDraw extends GameState {
  final GameStateModel gameState;

  const GameDraw(this.gameState);

  @override
  List<Object?> get props => [gameState];
}
