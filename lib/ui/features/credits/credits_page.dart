import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:testbank/redux/store/app.state.dart';
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
      body: StoreBuilder<AppState>(
        builder: (context, state) {
          var creditState = state.state.creditsState;
          if (creditState.loading) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.amber));
          } else if (creditState.credits.isNotEmpty) {
            return CreditsList(creditState.credits);
          } else {
            return const SizedBox();
          }
        },
      ),
    ));
  }
}
