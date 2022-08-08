import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddTransactionDialog extends StatefulWidget {
  final Function addTransactionHandler;

  AddTransactionDialog(this.addTransactionHandler);

  @override
  State<AddTransactionDialog> createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {
  final titleController = TextEditingController();
  final costController = TextEditingController();

  DateTime _selectedDate;

  void submitData() {
    if (costController.text == null) return;
    
    final enteredTitle = titleController.text;
    final enteredCost = double.parse(costController.text);

    if (enteredTitle == "" || enteredCost <= 0) return;

    widget.addTransactionHandler(enteredTitle, enteredCost, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) => {
              if (value != null)
                setState(() {
                  _selectedDate = value;
                })
            });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              maxLength: 20,
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(labelText: 'Cost'),
              controller: costController,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    _selectedDate == null
                        ? 'No Date Chosen!'
                        : DateFormat.yMMMd().format(_selectedDate),
                    style: TextStyle(fontSize: 18),
                  ),
                  OutlinedButton(
                    onPressed: _presentDatePicker,
                    child: Text('Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ElevatedButton(
                  onPressed: submitData,
                  child: Text(
                    'Add',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
