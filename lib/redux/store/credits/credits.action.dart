import 'package:testbank/redux/store/credits/credits.state.dart';

class CreditsAction {
  @override
  String toString() {
    return 'CreditsAction { }';
  }
}

class GetCreditsAction {}

class CreditsSuccessAction {
  final CreditsState state;

  CreditsSuccessAction({required this.state});

  @override
  String toString() {
    return 'CreditsSuccessAction { isSuccess: $state }';
  }
}

class CreditsFailedAction {
  final String error;

  CreditsFailedAction({required this.error});

  @override
  String toString() {
    return 'CreditsFailedAction { error: $error }';
  }
}
