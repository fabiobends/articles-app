import 'package:flutter/material.dart';

class IndexView extends StatefulWidget {
  IndexView({Key? key}) : super(key: key);

  @override
  _IndexViewState createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Index"),
      ),
    );
  }
}
