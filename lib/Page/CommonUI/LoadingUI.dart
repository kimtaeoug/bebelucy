import 'package:bebelucy_flutter/SupportUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingUI extends StatefulWidget {
  final SupportUI _supportUI;

  LoadingUI(Key? key, this._supportUI) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoadingUI();
}

class _LoadingUI extends State<LoadingUI> with TickerProviderStateMixin {
  late final SupportUI _supportUI = widget._supportUI;

  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 2), vsync: this)
        ..repeat();
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.linear);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: _supportUI.resWidth(88),
            height: _supportUI.resHeight(88),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.black.withOpacity(0.3)),
          ),
        ),
        Center(
          child: RotationTransition(
            turns: _animation,
            child: SizedBox(
              width: _supportUI.resWidth(88),
              height: _supportUI.resHeight(88),
              child: Image.asset('images/logo_loading.png'),
            ),
          ),
        ),
        Center(
          child: Container(
            width: _supportUI.resWidth(60),
            height: _supportUI.resHeight(60),
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: Center(
              child: SizedBox(
                width: _supportUI.resWidth(43),
                height: _supportUI.resHeight(29),
                child: Image.asset('images/logo_only_image.png'),
              ),
            ),
          ),
        )
      ],
    );
  }
}
