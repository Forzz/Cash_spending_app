import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void submitData() {
    final enteredData = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredData.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(
      enteredData,
      enteredAmount,
    );
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
