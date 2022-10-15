import 'package:redux/redux.dart';
import 'package:testbank/redux/store/credits/credits.action.dart';
import './credits.state.dart';

final creditsReducer = combineReducers<CreditsState>([
  TypedReducer<CreditsState, GetCreditsAction>(getCredits),
  TypedReducer<CreditsState, CreditsSuccessAction>(addCredits),
]);

CreditsState getCredits(CreditsState credit, GetCreditsAction action) {
  return CreditsState(true, '', []);
}

CreditsState addCredits(CreditsState credit, CreditsSuccessAction action) {
  return action.state;
}
