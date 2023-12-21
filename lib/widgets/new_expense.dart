import 'dart:ui';
import 'package:expenses_app/model/expense.dart';
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

  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleControler.dispose();
    super.dispose();
  }

  void _expenseDatePicker() async {
    final today = DateTime.now();
    final firstDate = DateTime(today.year - 1, today.month, today.day);
    final pickedDate = await showDatePicker(
        context: context,
        firstDate: firstDate,
        lastDate: today,
        initialDate: today);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          //Title TextField
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
          Row(
            children: [
              //Amount TextField
              Expanded(
                child: TextField(
                  controller: _amountControler,
                  maxLength: 7,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                    labelStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Date Picker
                  Text(
                    _selectedDate == null
                        ? 'Select Date'
                        : formatter.format(_selectedDate!),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: _expenseDatePicker,
                    icon: const Icon(
                      Icons.calendar_month_outlined,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //Save Expense Btn
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
              //Cancel Btn
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
