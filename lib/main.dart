import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _obscureText = true;

  void _toggle() => setState(() => _obscureText = !_obscureText);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
                decoration: InputDecoration(
                    labelText: 'Here',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)))),
            TextField(
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () => _toggle(),
                    child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off),
                  ),
                  labelText: 'Here',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              obscureText: _obscureText,
            ),
          ]
              .map((input) => Container(
                    padding: EdgeInsets.only(bottom: 20),
                    child: input,
                  ))
              .toList(),
        ),
      )),
    );
  }
}
