import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_fencing/services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  final FirebaseUser currentUser;
  HomeScreen(this.currentUser);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
              child: RaisedButton(
                  onPressed: () async {
                    await Provider.of<AuthService>(context, listen: false).logout();

                    //Navigator.pushReplacementNamed(context, "/");
                  },
                  child: Text('Home Screen')))),
    );
  }
}
