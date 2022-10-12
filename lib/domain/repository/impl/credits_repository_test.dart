import 'package:testbank/domain/models/credit.dart';
import 'package:testbank/domain/repository/contract/credits_repository.dart';

class CreditsRepositoryTestImpl implements CreditsRepository {
  @override
  Future<List<CreditModel>> getCredits() async {
    var list = List.generate(10, (index) {
      var item = CreditModel.fromJson(jsonCredit);

      item.productName = ' ${item.productName} $index';

      return item;
    });
    await Future.delayed(const Duration(seconds: 1));

    return list;
  }
}

const jsonCredit = {
  "product_name": "Кредит на бизнес",
  "take_date": "12.09.2022",
  "amount": 100000,
  "percent": 18,
  "loanMonths": 18,
  "currency": "USD",
  "paymentDay": 10,
  "holidays": [
    "22.10.2022",
    "01.10.2022",
    "20.10.2022",
    "20.10.2022",
    "23.11.2022",
    "26.11.2022",
    "18.11.2022",
    "16.12.2022",
    "06.12.2022",
    "01.12.2022",
    "06.01.2023",
    "12.01.2023",
    "16.01.2023",
    "18.02.2023",
    "22.02.2023",
    "06.02.2023",
    "23.02.2023",
    "20.03.2023",
    "06.03.2023",
    "12.03.2023",
    "26.04.2023",
    "20.04.2023",
    "06.04.2023",
    "26.05.2023",
    "08.05.2023",
    "03.05.2023",
    "12.05.2023",
    "18.05.2023",
    "18.06.2023",
    "06.06.2023",
    "20.07.2023",
    "20.07.2023",
    "26.07.2023",
    "01.07.2023",
    "20.08.2023",
    "01.08.2023",
    "18.08.2023",
    "20.08.2023",
    "26.08.2023"
  ],
  "workDays": [
    "20.10.2022",
    "20.11.2022",
    "06.12.2022",
    "12.01.2023",
    "12.02.2023",
    "03.03.2023",
    "03.04.2023",
    "12.05.2023",
    "08.06.2023",
    "26.07.2023",
    "23.08.2023"
  ]
};
