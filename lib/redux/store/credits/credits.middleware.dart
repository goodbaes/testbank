import 'package:redux/redux.dart';
import 'package:testbank/redux/store/credits/credits.action.dart';

import '../../../domain/repository/contract/credits_repository.dart';
import '../app.state.dart';

Middleware<AppState> getCreditsMiddleware(CreditsRepository repo) {
  return (Store<AppState> store, action, NextDispatcher dispatch) async {
    if (action is GetCreditsAction) {
      dispatch(action);
      try {
        repo.getCredits().then((credits) => dispatch(CreditsSuccessAction(
            state: store.state.creditsState
                .copyWith(credits: credits, loading: false))));
        return;
      } catch (error) {
        dispatch(CreditsFailedAction(error: ''));
      }
    }
  };
}
