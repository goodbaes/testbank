import 'package:flutter/material.dart';

import 'package:testbank/domain/models/credit.dart';
import 'package:testbank/ui/widgets/calendar/calendar.dart';
import 'package:testbank/ui/widgets/fields/icon_text_field.dart';
import 'package:testbank/utils/format_data.dart';

class CreditWidget extends StatefulWidget {
  const CreditWidget({required this.isActive, required this.credit, super.key});
  final bool isActive;
  final CreditModel credit;

  @override
  State<CreditWidget> createState() => _CreditWidgetState();
}

class _CreditWidgetState extends State<CreditWidget> {
  late Widget calendar;

  @override
  void initState() {
    calendar = CalendarWidget(
        payDay: widget.credit.paymentDay ?? 1,
        lastDay: getLastDay(widget.credit.takeDate),
        holyDays: formatListStringDate(
          widget.credit.holidays,
        ),
        firstDay: DateTime.now(),
        workDays: formatListStringDate(
          widget.credit.workDays,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      widget.credit.productName ?? '',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  IconTextField(
                      iconData: Icons.track_changes,
                      text: 'Взят: ${widget.credit.formatTakeDate ?? ''}'),
                  IconTextField(
                    iconData: Icons.monetization_on,
                    text:
                        'Взятая сумма: ${widget.credit.amount?.toString() ?? ''} ${widget.credit.currency?.toString() ?? ''}',
                  ),
                ],
              ),
              AnimatedCrossFade(
                crossFadeState: widget.isActive
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconTextField(
                      iconData: Icons.pie_chart_sharp,
                      text:
                          'Процент: ${widget.credit.percent?.toString() ?? ''} %',
                    ),
                    IconTextField(
                      iconData: Icons.data_exploration_sharp,
                      text:
                          'На: ${widget.credit.loanMonths?.toString() ?? ''} Месяцев',
                    ),
                    calendar,
                  ],
                ),
                secondChild: const SizedBox(),
                duration: const Duration(milliseconds: 300),
              )
            ],
          ),
        ),
      ),
    );
  }
}
