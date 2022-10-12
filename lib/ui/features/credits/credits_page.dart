import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:testbank/bloc/credits_bloc/credits_bloc.dart';
import 'package:testbank/ui/features/credits/widgets/list.dart';

class CreditsPage extends StatelessWidget {
  const CreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Кредиты'),
      ),
      body: BlocProvider(
        create: (context) => CreditsBloc(GetIt.I.get()),
        child: BlocBuilder<CreditsBloc, CreditsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),
              loading: () => const Center(
                  child: CircularProgressIndicator(color: Colors.amber)),
              loaded: (credits) => CreditsList(credits),
              error: () => const SizedBox(),
            );
          },
        ),
      ),
    ));
  }
}
