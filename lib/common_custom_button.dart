import 'custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';


class CommonCustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final double width;
  final double height;
  final bool disable;
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? style;
  final bool showProgressIndicator;

  const CommonCustomButton({
    Key? key,
    this.title,
    this.onPressed,
    this.disable = false,
    this.width = 0.4,
    this.height = 50.0,
    this.fillColor,
    this.style,
    this.borderColor,
    this.showProgressIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: showProgressIndicator,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (Widget child, Animation<double> animation) =>
            ScaleTransition(child: child, scale: animation),
        child: showProgressIndicator
            ? const CustomCircularProgressIndicator()
            : SizedBox(
          width: MediaQuery.of(context).size.width * width,
          // height: height,
          child: TextButton(
            style: TextButton.styleFrom(
              elevation: 0,
              backgroundColor: fillColor ?? Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style: style,
              ),
            ),
            onPressed: disable ? null : onPressed,
          ),
        ),
      ),
    );
  }
}
