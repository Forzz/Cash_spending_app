import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredData = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredData.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredData,
      enteredAmount,
    );

    Navigator.of(context).pop();
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
              controller: titleController,
              onSubmitted: (_) => submitData,
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => submitData,
              // onChanged: (value) {
              //   amountInput = value;
              // },
            ),
            FlatButton(
              onPressed: submitData,
              textColor: Colors.red[800],
              child: const Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
