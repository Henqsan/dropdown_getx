import 'package:flutter/material.dart';

class BuildLoading {
  String text;
  double circularIndicatorSize;

  BuildLoading({@required this.text, this.circularIndicatorSize});

  showLoading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: circularIndicatorSize ?? 25,
            width: circularIndicatorSize ?? 25,
            child: CircularProgressIndicator(),
          ),
          SizedBox(height: 10.0),
          Text(text),
        ],
      ),
    );
  }
}
