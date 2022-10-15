import './credits/credits.reducer.dart';

import './app.state.dart';
AppState appReducer(AppState state, action) => AppState(creditsState: creditsReducer(state.creditsState, action),);
	