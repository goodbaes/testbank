import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbank/bloc/current_index_cubit.dart/current_index_cubit.dart';
import 'package:testbank/domain/models/credit.dart';
import 'package:testbank/ui/widgets/credit_widget/credit_widget.dart';

class CreditsList extends StatelessWidget {
  const CreditsList(this.credits, {super.key});
  final List<CreditModel> credits;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentIndexCubit(),
      child: BlocBuilder<CurrentIndexCubit, int>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: credits.length,
              itemBuilder: (context, index) {
                var credit = credits[index];

                return InkWell(
                  onTap: () =>
                      context.read<CurrentIndexCubit>().changeIndex(index),
                  child: CreditWidget(
                    credit: credit,
                    isActive: state == index,
                  ),
                );
              });
        },
      ),
    );
  }
}
