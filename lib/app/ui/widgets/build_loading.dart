import 'package:flutter/material.dart';

class BuildLoading extends StatelessWidget {
  String text;
  BuildLoading(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          SizedBox(height: 10.0),
          Text(text),
        ],
      ),
    );
  }
}
