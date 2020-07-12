import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredData = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredData.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredData,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now(),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark(),
            child: child,
          );
        }).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitData,
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              onSubmitted: (_) => _submitData,
              // onChanged: (value) {
              //   amountInput = value;
              // },
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      _selectedDate == null
                          ? 'No date chosen'
                          : 'Picked date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).buttonColor,
                    onPressed: _presentDatePicker,
                    child: const Text('Choose date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: _submitData,
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).buttonColor,
              child: const Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
