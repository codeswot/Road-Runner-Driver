import 'dart:async';
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

enum ButtonState { busy, idle }

class ArgonButton extends StatefulWidget {
  final double height;
  final double width;
  final double minWidth;
  final Widget? loader;
  final Duration animationDuration;
  final Curve curve;
  final Curve reverseCurve;
  final Widget child;
  final Function(
      Function startLoading, Function stopLoading, ButtonState btnState)? onTap;
  final Color? color;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Brightness? colorBrightness;
  final double? elevation;
  final double? focusElevation;
  final double? hoverElevation;
  final double? highlightElevation;
  final EdgeInsetsGeometry padding;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool roundLoadingShape;
  final double borderRadius;
  final BorderSide borderSide;
  final double? disabledElevation;
  final Color? disabledColor;
  final Color? disabledTextColor;

  const ArgonButton(
      {super.key,
      required this.height,
      required this.width,
      this.minWidth = 0,
      this.loader,
      this.animationDuration = const Duration(milliseconds: 450),
      this.curve = Curves.easeInOutCirc,
      this.reverseCurve = Curves.easeInOutCirc,
      required this.child,
      this.onTap,
      this.color,
      this.focusColor,
      this.hoverColor,
      this.highlightColor,
      this.splashColor,
      this.colorBrightness,
      this.elevation,
      this.focusElevation,
      this.hoverElevation,
      this.highlightElevation,
      this.padding = const EdgeInsets.all(0),
      this.borderRadius = 0.0,
      this.clipBehavior = Clip.none,
      this.focusNode,
      this.materialTapTargetSize,
      this.roundLoadingShape = true,
      this.borderSide = const BorderSide(color: Colors.transparent, width: 0),
      this.disabledElevation,
      this.disabledColor,
      this.disabledTextColor})
      : assert(elevation == null || elevation >= 0.0),
        assert(focusElevation == null || focusElevation >= 0.0),
        assert(hoverElevation == null || hoverElevation >= 0.0),
        assert(highlightElevation == null || highlightElevation >= 0.0),
        assert(disabledElevation == null || disabledElevation >= 0.0);

  @override
  _ArgonButtonState createState() => _ArgonButtonState();
}

class _ArgonButtonState extends State<ArgonButton>
    with TickerProviderStateMixin {
  double? loaderWidth;

  late Animation<double> _animation;
  late AnimationController _controller;
  ButtonState btn = ButtonState.idle;

  final GlobalKey _buttonKey = GlobalKey();
  double _minWidth = 0;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: widget.animationDuration);

    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
        reverseCurve: widget.reverseCurve));

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          btn = ButtonState.idle;
        });
      }
    });

    minWidth = widget.height;
    loaderWidth = widget.height;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void animateForward() {
    setState(() {
      btn = ButtonState.busy;
    });
    _controller.forward();
  }

  void animateReverse() {
    _controller.reverse();
  }

  lerpWidth(a, b, t) {
    if (a == 0.0 || b == 0.0) {
      return null;
    } else {
      return a + (b - a) * t;
    }
  }

  double get minWidth => _minWidth;
  set minWidth(double w) {
    if (widget.minWidth == 0) {
      _minWidth = w;
    } else {
      _minWidth = widget.minWidth;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return buttonBody();
      },
    );
  }

  Widget buttonBody() {
    return SizedBox(
      height: widget.height,
      width: lerpWidth(widget.width, minWidth, _animation.value),
      child: ButtonTheme(
        height: widget.height,
        shape: RoundedRectangleBorder(
          side: widget.borderSide,
          borderRadius: BorderRadius.circular(widget.roundLoadingShape
              ? lerpDouble(
                  widget.borderRadius, widget.height / 2, _animation.value)!
              : widget.borderRadius),
        ),
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(widget.color),
              elevation: MaterialStateProperty.all(0),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            key: _buttonKey,
            clipBehavior: widget.clipBehavior,
            focusNode: widget.focusNode,
            onPressed: btn == ButtonState.idle
                ? () {
                    widget.onTap!(
                        () => animateForward(), () => animateReverse(), btn);
                    // btnClicked();
                  }
                : null,
            child: btn == ButtonState.idle ? widget.child : widget.loader),
      ),
    );
  }
}

class ArgonTimerButton extends StatefulWidget {
  final double height;
  final double width;
  final double minWidth;
  final Function(int time)? loader;
  final Duration animationDuration;
  final Curve curve;
  final Curve reverseCurve;
  final Widget child;
  final Function(Function startTimer, ButtonState? btnState)? onTap;
  final Color? color;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Brightness? colorBrightness;
  final double? elevation;
  final double? focusElevation;
  final double? hoverElevation;
  final double? highlightElevation;
  final EdgeInsetsGeometry padding;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool roundLoadingShape;
  final double borderRadius;
  final BorderSide borderSide;
  final double? disabledElevation;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final int initialTimer;

  const ArgonTimerButton(
      {super.key,
      required this.height,
      required this.width,
      this.minWidth = 0,
      this.loader,
      this.animationDuration = const Duration(milliseconds: 450),
      this.curve = Curves.easeInOutCirc,
      this.reverseCurve = Curves.easeInOutCirc,
      required this.child,
      this.onTap,
      this.color,
      this.focusColor,
      this.hoverColor,
      this.highlightColor,
      this.splashColor,
      this.colorBrightness,
      this.elevation,
      this.focusElevation,
      this.hoverElevation,
      this.highlightElevation,
      this.padding = const EdgeInsets.all(0),
      this.borderRadius = 0.0,
      this.clipBehavior = Clip.none,
      this.focusNode,
      this.materialTapTargetSize,
      this.roundLoadingShape = true,
      this.borderSide = const BorderSide(color: Colors.transparent, width: 0),
      this.disabledElevation,
      this.disabledColor,
      this.disabledTextColor,
      this.initialTimer = 0})
      : assert(elevation == null || elevation >= 0.0),
        assert(focusElevation == null || focusElevation >= 0.0),
        assert(hoverElevation == null || hoverElevation >= 0.0),
        assert(highlightElevation == null || highlightElevation >= 0.0),
        assert(disabledElevation == null || disabledElevation >= 0.0);

  @override
  _ArgonTimerButtonState createState() => _ArgonTimerButtonState();
}

class _ArgonTimerButtonState extends State<ArgonTimerButton>
    with TickerProviderStateMixin {
  double? loaderWidth;

  late Animation<double> _animation;
  late AnimationController _controller;
  ButtonState? btn;
  int secondsLeft = 0;
  Timer? _timer;
  Stream emptyStream = const Stream.empty();
  double _minWidth = 0;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: widget.animationDuration);

    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
        reverseCurve: widget.reverseCurve));

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          btn = ButtonState.idle;
        });
      }
    });

    if (widget.initialTimer == 0) {
      btn = ButtonState.idle;
    } else {
      startTimer(widget.initialTimer);
      btn = ButtonState.busy;
    }

    minWidth = widget.height;
    loaderWidth = widget.height;
  }

  @override
  void dispose() {
    if (_timer != null) _timer!.cancel();
    _controller.dispose();
    super.dispose();
  }

  void animateForward() {
    setState(() {
      btn = ButtonState.busy;
    });
    _controller.forward();
  }

  void animateReverse() {
    _controller.reverse();
  }

  lerpWidth(a, b, t) {
    if (a == 0.0 || b == 0.0) {
      return null;
    } else {
      return a + (b - a) * t;
    }
  }

  double get minWidth => _minWidth;
  set minWidth(double w) {
    if (widget.minWidth == 0) {
      _minWidth = w;
    } else {
      _minWidth = widget.minWidth;
    }
  }

  void startTimer(int newTime) {
    if (newTime == 0) {
      throw ("Count Down Time can not be null");
    }

    animateForward();

    setState(() {
      secondsLeft = newTime;
    });

    if (_timer != null) {
      _timer!.cancel();
    }

    var oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (secondsLeft < 1) {
            timer.cancel();
          } else {
            secondsLeft = secondsLeft - 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return buttonBody();
      },
    );
  }

  Widget buttonBody() {
    return SizedBox(
      height: widget.height,
      width: lerpWidth(widget.width, minWidth, _animation.value),
      child: ButtonTheme(
        height: widget.height,
        buttonColor: widget.color,
        shape: RoundedRectangleBorder(
          side: widget.borderSide,
          borderRadius: BorderRadius.circular(widget.roundLoadingShape
              ? lerpDouble(
                  widget.borderRadius, widget.height / 2, _animation.value)!
              : widget.borderRadius),
        ),
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(widget.color),
              elevation: MaterialStateProperty.all(0),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: btn == ButtonState.idle
                ? () {
                    widget.onTap!((newCounter) => startTimer(newCounter), btn);
                  }
                : null,
            child: btn == ButtonState.idle
                ? widget.child
                : StreamBuilder(
                    stream: emptyStream,
                    builder: (context, snapshot) {
                      if (secondsLeft == 0) {
                        animateReverse();
                      }
                      return widget.loader!(secondsLeft);
                    })),
      ),
    );
  }
}
