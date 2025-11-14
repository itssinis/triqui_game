import '../models/models.dart';

class GameRepository {
  // Verificar si hay ganador
  PlayerSymbol? checkWinner(List<PlayerSymbol> board) {
    // Combinaciones ganadoras
    const winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (final combination in winningCombinations) {
      final a = board[combination[0]];
      final b = board[combination[1]];
      final c = board[combination[2]];

      if (a != PlayerSymbol.empty && a == b && b == c) {
        return a;
      }
    }
    return null;
  }

  // Verificar si el tablero está lleno
  bool isBoardFull(List<PlayerSymbol> board) {
    return board.every((symbol) => symbol != PlayerSymbol.empty);
  }

  // Obtener el siguiente jugador
  PlayerSymbol getNextPlayer(PlayerSymbol currentPlayer) {
    return currentPlayer == PlayerSymbol.x ? PlayerSymbol.o : PlayerSymbol.x;
  }

  // Hacer un movimiento
  GameStateModel makeMove(GameStateModel gameState, int position) {
    if (gameState.board[position] != PlayerSymbol.empty ||
        gameState.gameOver) {
      return gameState; // Movimiento inválido
    }

    final newBoard = List<PlayerSymbol>.from(gameState.board);
    newBoard[position] = gameState.currentPlayer;
    final newMoveCount = gameState.moveCount + 1;

    final winner = checkWinner(newBoard);
    final isFull = isBoardFull(newBoard);

    return gameState.copyWith(
      board: newBoard,
      currentPlayer: getNextPlayer(gameState.currentPlayer),
      gameOver: winner != null || isFull,
      winner: winner,
      moveCount: newMoveCount,
    );
  }
}
