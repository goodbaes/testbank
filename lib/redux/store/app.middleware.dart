import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';
import 'package:testbank/redux/store/credits/credits.action.dart';
import 'package:testbank/redux/store/credits/credits.middleware.dart';
import './app.state.dart';

List<Middleware<AppState>> appMiddleware() {
  final Middleware<AppState> getCredits = getCreditsMiddleware(GetIt.I.get());

  return [
    TypedMiddleware<AppState, GetCreditsAction>(getCredits),
  ];
}
