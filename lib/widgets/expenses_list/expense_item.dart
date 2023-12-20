import 'package:expenses_app/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItems extends StatelessWidget {
  const ExpenseItems(this.expensItem, {super.key});

  final Expense expensItem;

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  expensItem.category.,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Date',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Title',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '2000Rs',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
