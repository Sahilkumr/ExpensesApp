import 'package:expenses_app/model/expense.dart';
import 'package:expenses_app/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expense, required this.onRemoveExpense});

  final List<Expense> expense; // to receive the list of expense.
  final Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Colors.red,
        ),
          key: ValueKey<Expense>(expense[index]),
          onDismissed: (direction) {
            onRemoveExpense(expense[index]);
          },
          child: ExpenseItems(expense[index])),
      itemCount: expense.length,
    );
  }
}
