import 'package:intl/intl.dart';

DateTime formatDate(String date) {
  return DateTime.parse(date.split('.').reversed.toList().join('-'));
}

List<DateTime> formatListStringDate(List<String>? dates) {
  final List<DateTime> days = (dates ?? []).map((e) => formatDate(e)).toList();

  return days;
}

String formatDateToString(DateTime date) {
  var formatter = DateFormat.yMMMd('ru');
  return formatter.format(date);
}

DateTime getLastDay(String? date) {
  var takeDate = formatDate(date ?? '2000-01-01');
  var finalDate = DateTime(takeDate.year, takeDate.month + 16, takeDate.day);
  return finalDate;
}
