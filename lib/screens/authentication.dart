import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';
import 'package:social_fencing/services/auth_service.dart';
import 'package:social_fencing/widgets/authentication_parts.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  TextEditingController loginUsernameController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController registerUsernameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 90),
                        child: Column(
                          children: <Widget>[
                            AuthenticationTitle('Name Goes Here'),
                            InputField('Email', loginUsernameController),
                            PasswordField(loginPasswordController),
                            SizedBox(
                              height: 10,
                            ),
                            AuthenticationButton('Login', () async {
                              try {
                                FirebaseUser result =
                                    await Provider.of<AuthService>(context, listen: false)
                                        .loginUser(
                                            email: loginUsernameController.text,
                                            password:
                                                loginPasswordController.text);
                                print(result);
                              } on AuthException catch (error) {
                                return _buildErrorDialog(
                                    context, error.message);
                              } on Exception catch (error) {
                                return _buildErrorDialog(
                                    context, error.toString());
                              }
                            })
                          ]
                              .map((input) => Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 20, right: 15, left: 20),
                                    child: input,
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  SignInButton(
                    Buttons.Google,
                    text: "Authenticate with Google",
                    onPressed: () => print('Sign in button pressed'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 70),
                        child: Column(
                          children: <Widget>[
                            AuthenticationTitle('Register'),
                            InputField('Username', registerUsernameController),
                            InputField('Email', registerEmailController),
                            PasswordField(registerPasswordController),
                            SizedBox(
                              height: 10,
                            ),
                            AuthenticationButton('sign up', () async {
                              try {
                                FirebaseUser result =
                                    await Provider.of<AuthService>(context, listen: false)
                                        .createUser(
                                            username:
                                                registerUsernameController.text,
                                            email: registerEmailController.text,
                                            password: registerPasswordController
                                                .text);
                              } on AuthException catch (error) {
                                return _buildErrorDialog(
                                    context, error.message);
                              } on Exception catch (error) {
                                return _buildErrorDialog(
                                    context, error.toString());
                              }
                            })
                          ]
                              .map((input) => Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 20, right: 15, left: 20),
                                    child: input,
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _buildErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text('Error Message'),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }
}
