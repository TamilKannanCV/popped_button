import 'package:flutter/material.dart';
import 'package:popped_button/popped_button.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 200.0,
            height: 100.0,
            child: PoppedButton(
              depth: 10.5,
              color: Colors.yellow,
              child: Center(
                  child: Text(
                "Click me!",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              onPressed: () {
                debugPrint("Pressed");
              },
            ),
          ),
        ),
      ),
    );
  }
}
