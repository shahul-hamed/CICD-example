import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SuccessPage> createState() => SuccessPageState();
}

class SuccessPageState extends State<SuccessPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: const Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Text(
          'You have successfully logged in',
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}