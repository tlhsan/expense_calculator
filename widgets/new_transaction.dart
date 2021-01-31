import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // input controllers for title and amount
  final titleController = TextEditingController();
  final amoutController = TextEditingController();
  // take the func loc
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  // submit data function
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amoutController.text);

    // check if both entered
    if (enteredTitle == '' && enteredAmount < 0) {
      return; // do nothing
    }

    addTransaction(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) =>
                  submitData(), // (_) means ignore any return value, since anonymous func ase, so execute korte hobe ()
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amoutController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) =>
                  submitData(), // (_) means ignore any return value, since anonymous func ase, so execute korte hobe ()
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple[400],
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
