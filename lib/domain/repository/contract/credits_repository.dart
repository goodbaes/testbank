import 'package:testbank/domain/models/credit.dart';

abstract class CreditsRepository {
  Future<List<CreditModel>> getCredits();
}
