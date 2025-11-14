abstract class GameEvent {
  const GameEvent();
}

class GameStarted extends GameEvent {
  const GameStarted();
}

class CellTapped extends GameEvent {
  final int position;

  const CellTapped(this.position);
}

class GameReset extends GameEvent {
  const GameReset();
}
