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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.thumb_up_alt_sharp,color: Colors.green,size: 45,),
          SizedBox(height: 30,),
          Text(
            'You have successfully logged in the CICD setup',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
