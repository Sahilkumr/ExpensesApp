import 'package:expenses_app/model/expense.dart';
import 'package:expenses_app/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expense});

  final List<Expense> expense; // to receive the list of expense.

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) => ExpenseItems(expense[index]),
      itemCount: expense.length,
    );
  }
}
