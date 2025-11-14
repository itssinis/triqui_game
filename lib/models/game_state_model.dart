enum PlayerSymbol { x, o, empty }

class GameStateModel {
  final List<PlayerSymbol> board; // Lista de 9 posiciones
  final PlayerSymbol currentPlayer;
  final bool gameOver;
  final PlayerSymbol? winner;
  final int moveCount;

  const GameStateModel({
    required this.board,
    required this.currentPlayer,
    required this.gameOver,
    this.winner,
    this.moveCount = 0,
  });

  // Constructor para un juego nuevo
  factory GameStateModel.initial() {
    return GameStateModel(
      board: List.filled(9, PlayerSymbol.empty),
      currentPlayer: PlayerSymbol.x,
      gameOver: false,
      winner: null,
      moveCount: 0,
    );
  }

  // Copiar con cambios
  GameStateModel copyWith({
    List<PlayerSymbol>? board,
    PlayerSymbol? currentPlayer,
    bool? gameOver,
    PlayerSymbol? winner,
    int? moveCount,
  }) {
    return GameStateModel(
      board: board ?? this.board,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      gameOver: gameOver ?? this.gameOver,
      winner: winner ?? this.winner,
      moveCount: moveCount ?? this.moveCount,
    );
  }

  @override
  String toString() =>
      'GameStateModel(board: $board, currentPlayer: $currentPlayer, gameOver: $gameOver, winner: $winner, moveCount: $moveCount)';
}
