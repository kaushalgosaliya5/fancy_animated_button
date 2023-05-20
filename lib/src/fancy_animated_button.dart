import 'dart:async';

import 'package:flutter/material.dart';

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
  bool _show = true;
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
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          widget.onClick.call();
        },
        child: Text(widget.title ?? "Fancy Animation Button",
            style: _show
                ? TextStyle(color: widget.textColor ?? Colors.black)
                : const TextStyle(color: Colors.transparent)));
  }
}
