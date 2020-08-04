import 'package:flutter/material.dart';

class ShowLoadingDialog {
  BuildContext context;
  double circularIndicatorSize;
  bool willPop;

  ShowLoadingDialog({@required this.context, this.circularIndicatorSize, this.willPop});

  void showLoadingDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => willPop ?? false,
          child: Center(
            child: Container(
              height: circularIndicatorSize ?? 25,
              width: circularIndicatorSize ?? 25,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
              ),
            ),
          ),
        );
      },
    );
  }
}
