import 'package:flutter/material.dart';

class AuthenticationTitle extends StatelessWidget {
  String title;
  AuthenticationTitle(this.title);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        title,
        style: TextStyle(fontSize: 52, fontWeight: FontWeight.w300),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class InputField extends StatelessWidget {
  TextEditingController controller;
  String label;
  InputField(this.label, this.controller);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  TextEditingController controller;
  PasswordField(this.controller);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
                onTap: () => this.setState(() => _obscureText = !_obscureText),
                child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off)),
            labelText: 'Password',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
      ),
    );
  }
}

class AuthenticationButton extends StatelessWidget {
  String buttonText;
  Function() action;
  AuthenticationButton(this.buttonText, this.action);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 120,
        height: 40,
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
          child: Text(
            buttonText.toUpperCase(),
            style: TextStyle(color: Theme.of(context).canvasColor),
          ),
          onPressed: action
        ));
  }
}
