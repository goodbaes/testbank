import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testbank/domain/models/credit.dart';
import 'package:testbank/domain/repository/contract/credits_repository.dart';

part 'credits_event.dart';
part 'credits_state.dart';
part 'credits_bloc.freezed.dart';

class CreditsBloc extends Bloc<CreditsEvent, CreditsState> {
  CreditsBloc(CreditsRepository repository) : super(const _Initial()) {
    on<CreditsEvent>((event, emit) async {
      await event.when(started: () {
        emit(const _Loading());
        add(const _Load());
      }, load: () async {
        var result = await repository.getCredits();
        if (result.isEmpty) {
        } else {
          emit(_Loaded(result));
        }
      });
    });
    add(const _Started());
  }
}
