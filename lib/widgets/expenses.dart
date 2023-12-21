import 'package:expenses_app/widgets/expenses_list/expense_list.dart';
import 'package:expenses_app/widgets/new_expense.dart';
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

  void _openExpenseDrawer(){
    showModalBottomSheet(context: context, builder: (ctx) => const NewExpense());
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(154, 165, 241, 98),
        title: const Text(
          'Kharche',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        actions:  <Widget>[
          IconButton(onPressed: _openExpenseDrawer, icon: const Icon(Icons.add,size: 35,)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ExpenseList(expense: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
