import 'package:get_it/get_it.dart';
import 'package:testbank/domain/repository/contract/credits_repository.dart';
import 'package:testbank/domain/repository/impl/credits_repository_test.dart';

initDi() {
  GetIt.I.registerSingleton<CreditsRepository>(CreditsRepositoryTestImpl());
}
