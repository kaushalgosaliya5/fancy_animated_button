import 'dart:async';

import 'package:flutter/material.dart';

/// Fancy Animation Button display different type of animation and add specific timer of animation
class FancyAnimatedButton extends StatefulWidget {

  ///  add message text in button
  final String? title;
  // perform event on this method
  final VoidCallback onClick;
  /// change text color of button
  final Color? textColor;
  /// weather button display animation or not
  final bool? isAnimated;
  /// set timer of specific animation
  final int? animationTimerMS;

  const FancyAnimatedButton(
      {Key? key,
      this.title,
      this.textColor,
      this.isAnimated,
      this.animationTimerMS,
      required this.onClick})
      : super(key: key);

  @override
  State<FancyAnimatedButton> createState() => _FancyAnimatedButtonState();
}

class _FancyAnimatedButtonState extends State<FancyAnimatedButton> {
  /// weather display animation or not default true
  bool _show = true;
  /// timer handle display text specific interval
  Timer? _timer;

  @override
  void initState() {
    if (widget.isAnimated ?? true) {
      _timer = Timer.periodic(
          Duration(milliseconds: widget.animationTimerMS ?? 1000), (_) {
        setState(() {
          _show = !_show;
        });
      });
    }
    super.initState();
  }

  @override
  void dispose() {
   /// timer object clear in memory
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Return animation button to ui with specific attribute
    return ElevatedButton(
        onPressed: () {
         // click event perform and call back to return
          widget.onClick.call();
        },
        child: Text(widget.title ?? "Fancy Animation Button",
            style: _show
                ? TextStyle(color: widget.textColor ?? Colors.black)
                : const TextStyle(color: Colors.transparent)));
  }
}
