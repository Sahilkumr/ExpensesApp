import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
//a model for the expense app to display or get the data required.

final formatter = DateFormat.yMd();  // get the formatterd date format

const uuid = Uuid();
//enum to display the Category of Expense with default values only.
enum Category {food, health, travel, work}

class Expense {
  Expense({
    required this.amount,
    required this.title,
    required this.date,
    required this.category, 
  }) : id = uuid.v4();

  // final String exprensor;  Enable if multiuser supported
  final double amount;
  final String id;
  final String title;
  final DateTime date;
  final Category category;

  get formattedDate {
    return formatter.format(date);
  }
}
