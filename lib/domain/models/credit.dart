import 'package:testbank/utils/format_data.dart';

class CreditModel {
  String? productName;
  String? takeDate;
  int? amount;
  int? percent;
  int? loanMonths;
  String? currency;
  int? paymentDay;
  List<String>? holidays;
  List<String>? workDays;

  CreditModel({
    this.productName,
    this.takeDate,
    this.amount,
    this.percent,
    this.loanMonths,
    this.currency,
    this.paymentDay,
    this.holidays,
    this.workDays,
  });

  String? get formatTakeDate => formatDateToString(formatDate(takeDate ?? ''));
  CreditModel.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    takeDate = json['take_date'];
    amount = json['amount'];
    percent = json['percent'];
    loanMonths = json['loanMonths'];
    currency = json['currency'];
    paymentDay = json['paymentDay'];
    holidays = json['holidays'].cast<String>();
    workDays = json['workDays'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_name'] = productName;
    data['take_date'] = takeDate;
    data['amount'] = amount;
    data['percent'] = percent;
    data['loanMonths'] = loanMonths;
    data['currency'] = currency;
    data['paymentDay'] = paymentDay;
    data['holidays'] = holidays;
    data['workDays'] = workDays;
    return data;
  }
}
