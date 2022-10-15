import './credits/credits.state.dart';

class AppState {
  final CreditsState creditsState;

  AppState({required this.creditsState});

  factory AppState.initial() => AppState(
        creditsState: CreditsState.initial(),
      );

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          creditsState == other.creditsState;

  @override
  int get hashCode => super.hashCode ^ creditsState.hashCode;

  @override
  String toString() {
    return "AppState { creditsState: $creditsState }";
  }
}
