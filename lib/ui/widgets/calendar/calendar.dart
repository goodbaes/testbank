import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    required this.firstDay,
    required this.holyDays,
    required this.lastDay,
    required this.payDay,
    required this.workDays,
    super.key,
  });

  final int payDay;
  final DateTime firstDay, lastDay;
  final List<DateTime> holyDays, workDays;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  var focusedDay = DateTime.now();

  setFocusedDay(DateTime date) {
    setState(() {
      focusedDay = date;
    });
  }

  DateTime dayAfterHolyDays() {
    var payDay = DateTime(focusedDay.year, focusedDay.month, widget.payDay);

    while (widget.holyDays.contains(payDay) ||
        payDay.weekday == 7 ||
        payDay.weekday == 6) {
      if (widget.workDays.contains(payDay)) {
        break;
      }
      payDay = payDay.add(const Duration(days: 1));
    }

    return payDay;
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ru',
      startingDayOfWeek: StartingDayOfWeek.monday,
      onPageChanged: ((focusedDay) => setFocusedDay(focusedDay)),
      availableCalendarFormats: const {CalendarFormat.month: 'Month'},
      selectedDayPredicate: (day) {
        if (day.isSameDate(dayAfterHolyDays())) {
          return true;
        }
        return false;
      },
      availableGestures: AvailableGestures.horizontalSwipe,
      lastDay: widget.lastDay,
      calendarBuilders: CalendarBuilders(
          selectedBuilder: ((context, day, focusedDay) => Container(
                decoration: const BoxDecoration(
                    color: Colors.teal, shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    day.day.toString(),
                    style: const TextStyle(
                        color: Colors.yellow, fontWeight: FontWeight.w700),
                  ),
                ),
              )),
          todayBuilder: ((context, day, focusedDay) => Container(
              alignment: Alignment.center, child: Text(day.day.toString())))),
      firstDay: widget.firstDay,
      focusedDay: focusedDay,
    );
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
