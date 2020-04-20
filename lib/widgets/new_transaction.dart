import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                    // onChanged: (value) {
                    //   titleInput = value;
                    // },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: _amountController,
                    // onChanged: (value) {
                    //   amountInput = value;
                    // },
                  ),
                  FlatButton(
                    child: Text('Add Transaction'),
                    onPressed: () {
                      print('${_titleController.text} ${_amountController.text}');
                    },
                    textColor: Colors.red[800],
                  )
                ],
              ),
            ),
          );
  }
}