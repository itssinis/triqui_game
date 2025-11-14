import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/models.dart';
import '../repositories/repositories.dart';
import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GameRepository gameRepository;
  late GameStateModel _currentGameState;

  GameBloc({required this.gameRepository}) : super(const GameInitial()) {
    on<GameStarted>(_onGameStarted);
    on<CellTapped>(_onCellTapped);
    on<GameReset>(_onGameReset);
  }

  Future<void> _onGameStarted(GameStarted event, Emitter<GameState> emit) async {
    _currentGameState = GameStateModel.initial();
    emit(GamePlaying(_currentGameState));
  }

  Future<void> _onCellTapped(CellTapped event, Emitter<GameState> emit) async {
    if (state is! GamePlaying) return;

    final newGameState = gameRepository.makeMove(_currentGameState, event.position);

    if (newGameState.gameOver) {
      if (newGameState.winner != null) {
        _currentGameState = newGameState;
        emit(GameWon(newGameState, newGameState.winner!));
      } else {
        _currentGameState = newGameState;
        emit(GameDraw(newGameState));
      }
    } else {
      _currentGameState = newGameState;
      emit(GamePlaying(newGameState));
    }
  }

  Future<void> _onGameReset(GameReset event, Emitter<GameState> emit) async {
    _currentGameState = GameStateModel.initial();
    emit(GamePlaying(_currentGameState));
  }
}
