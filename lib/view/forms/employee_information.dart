import 'package:flutter/material.dart';

class EmployeeInformationForm extends StatefulWidget {
  @override
  _EmployeeInformationFormState createState() =>
      _EmployeeInformationFormState();
}

class _EmployeeInformationFormState extends State<EmployeeInformationForm> {
  Future<void> handleConfirm() async {} // todo implement logic
  Future<void> handleCancel() async {} // todo implement logic

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: <Widget>[
            _usernameInput(),
            _firstNameInput(),
            _lastNameInput(),
            _phoneInput(),
            _emailInput(),
            Row(
              children: <Widget>[
                _confirmCreateEmployeeAction(handleConfirm, "Save"),
                _cancelCreateEmployee(handleCancel, "Cancel")
              ],
            )
          ],
        ),
      ),
    );
  }
}

// todo implement widget build
Widget _usernameInput() {
  return TextFormField();
}

// todo implement widget build
Widget _firstNameInput() {
  return TextFormField();
}

// todo implement widget build
Widget _lastNameInput() {
  return TextFormField();
}

// todo implement widget build
Widget _phoneInput() {
  return TextFormField();
}

// todo implement widget build
Widget _emailInput() {
  return TextFormField();
}

// todo implement widget build
Widget _confirmCreateEmployeeAction(
    Future<void> Function() handler, String label) {
  return RaisedButton(
    onPressed: handler,
    child: Text(label),
  );
}

// todo implement widget build
Widget _cancelCreateEmployee(Future<void> Function() handler, String label) {
  return RaisedButton(
    onPressed: handler,
    child: Text(label),
  );
}
