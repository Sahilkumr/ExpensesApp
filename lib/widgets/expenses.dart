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

  void _openExpenseDrawer() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => NewExpense(
              onSubmitNewExpense: _addNewExpense,
            ));
  }

  void _addNewExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final deletedExpeseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense Deleted'),
      duration: const Duration(seconds: 1),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(deletedExpeseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(Object context) {
    Widget emptyNonEmptyExpense = const Center(
      child: Text('No Expense Found, Enter One!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      emptyNonEmptyExpense = ExpenseList(
        expense: _registeredExpenses,
        onRemoveExpense: (expense) => _removeExpense(expense),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(154, 165, 241, 98),
        title: const Text(
          'Kharche',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: _openExpenseDrawer,
              icon: const Icon(
                Icons.add,
                size: 35,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: emptyNonEmptyExpense,
          ),
        ],
      ),
    );
  }
}
