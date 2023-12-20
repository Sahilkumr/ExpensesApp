import 'package:expenses_app/widgets/expenses_list/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:expenses_app/model/expense.dart';

/// main expenses app screen.
class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        amount: 2000,
        date: DateTime.now(),
        title: 'Flutter Course',
        category: Category.work),
    Expense(
        amount: 500,
        date: DateTime.now(),
        title: 'Pizza',
        category: Category.food),
  ];
  @override
  Widget build(Object context) {
    return Scaffold(
      body: Column(
        children: [ 
          const Text('hi everyone'),
          Expanded(
            child: ExpenseList(expense: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
