import 'package:testbank/domain/models/credit.dart';

class CreditsState {
  final bool loading;
  final String error;
  final List<CreditModel> credits;
  CreditsState(this.loading, this.error, this.credits);

  factory CreditsState.initial() => CreditsState(false, '', []);

  CreditsState copyWith(
          {bool? loading, String? error, List<CreditModel>? credits}) =>
      CreditsState(loading ?? this.loading, error ?? this.error,
          credits ?? this.credits);

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is CreditsState &&
          runtimeType == other.runtimeType &&
          loading == other.loading &&
          credits == other.credits &&
          error == other.error;

  @override
  int get hashCode =>
      super.hashCode ^ runtimeType.hashCode ^ loading.hashCode ^ error.hashCode;

  @override
  String toString() => "CreditsState { loading: $loading,  error: $error}";
}
