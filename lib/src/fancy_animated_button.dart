import 'dart:async';

import 'package:flutter/material.dart';

// Fancy Animation Button
// Field [String? title] add text title
// Field [VoidCallback onClick] perform event on button click
// Field [Color? textColor] display text color in button
// Field [bool? isAnimated] animation display bool variable true or false
// Field [int? animationTimerMS] add animation timer
class FancyAnimatedButton extends StatefulWidget {
  final String? title;
  final VoidCallback onClick;
  final Color? textColor;
  final bool? isAnimated;
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
 // display text blink mode
  bool _show = true;
  // timer handle display text specific interval
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
    return ElevatedButton(
        onPressed: () {
         /// click event perform and call back to return
          widget.onClick.call();
        },
        child: Text(widget.title ?? "Fancy Animation Button",
            style: _show
                ? TextStyle(color: widget.textColor ?? Colors.black)
                : const TextStyle(color: Colors.transparent)));
  }
}
