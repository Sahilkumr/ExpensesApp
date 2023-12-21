import 'package:expenses_app/model/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onSubmitNewExpense});

  final void Function(Expense expense) onSubmitNewExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();

  Category _selectedDropDownValue = Category.health;

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

  void _submitExpenseData() {
    //Validating Data To Be Passed
    final enteredAmount = double.tryParse(_amountControler.text);
    final amountInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleControler.text.trim().isEmpty ||
        amountInvalid ||
        _selectedDate == null) {
      //dialog error or re-try msg
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
              'Some Missing or Invalid Values Found. Please Check !'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Okay')),
          ],
        ),
      );
      return;
    } //if end

    widget.onSubmitNewExpense(
      Expense(
          amount: enteredAmount,
          title: _titleControler.text,
          date: _selectedDate!,
          category: _selectedDropDownValue),
    );
    Navigator.pop(context);
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Amount TextField
              Expanded(
                child: TextField(
                  controller: _amountControler,
                  maxLength: 7,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                    labelStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              // const SizedBox(
              //   width: 30,
              // ),

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
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //DropDownMenu
              DropdownButton(
                value: _selectedDropDownValue,
                items: Category.values
                    .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase())))
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedDropDownValue = value;
                  });
                },
              ),
              const Spacer(),
              //Save Expense Btn
              ElevatedButton(
                onPressed: _submitExpenseData,
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
