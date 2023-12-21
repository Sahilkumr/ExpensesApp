import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();

  @override
  void dispose() {
    _titleControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleControler,
            maxLength: 40,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              label: Text('Title'),
              labelStyle: TextStyle(fontSize: 18),
            ),
          ),
          TextField(
            controller: _amountControler,
            maxLength: 10,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              label: Text('Amount'),
              labelStyle: TextStyle(fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  print(_titleControler.text);
                  print(_amountControler.text);
                },
                child: const Text(
                  'Save Expense',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
              )),
            ],
          ),
          
        ],
      ),
    );
  }
}
