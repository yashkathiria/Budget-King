

import 'package:firebase_app_web/models/expense_model.dart';

class Category {
  final String name;
  final double maxAmount;
  final List<Expense> expenses;
  Category(
    this.name,
    this.maxAmount,
    this.expenses,
    //{int expenses, int maxAmount, String name}
  );
  //aama upar curley bracket mukvu padse Category({this.name, this.maxAmount, this.expenses});

}
