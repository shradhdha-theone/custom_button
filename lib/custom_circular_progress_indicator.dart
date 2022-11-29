import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final Color? color;
  final double? size;

  const CustomCircularProgressIndicator({
    Key? key,
    this.color = Colors.white,
    this.size = 40.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: size,
        height: size,
        child: Platform.isIOS
            ? Theme(
          data: ThemeData(
            cupertinoOverrideTheme: const CupertinoThemeData(
              // TODO
              brightness: Brightness.light,
            ),
          ),
          child: const CupertinoActivityIndicator(radius: 14.0),
        )
            : CircularProgressIndicator(
          backgroundColor: Colors.amber,
          color: color,
          strokeWidth: 3.5,
        ),
      ),
    );
  }
}
