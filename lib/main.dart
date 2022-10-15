import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:testbank/di/init_di.dart';
import 'package:testbank/redux/store/app.reducer.dart';
import 'package:testbank/redux/store/app.state.dart';
import 'package:testbank/redux/store/credits/credits.action.dart';
import 'package:testbank/ui/features/credits/credits_page.dart';

import 'redux/store/app.middleware.dart';

void main() {
  initDi();

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: appMiddleware(),
  );

  store.dispatch(GetCreditsAction());
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  const MyApp(this.store, {super.key});

  final Store<AppState> store;
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ru', ''),
        ],
        locale: const Locale('ru', ''),
        title: 'Flutter Demo',
        theme: ThemeData(
          colorSchemeSeed: Colors.teal,
          useMaterial3: true,
        ),
        home: const CreditsPage(),
      ),
    );
  }
}
