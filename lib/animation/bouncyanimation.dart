import 'package:flutter/cupertino.dart';

class BouncyAnimation extends PageRouteBuilder {
  final Widget widget;

  BouncyAnimation({required this.widget})
      : super(
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            animation =
                CurvedAnimation(parent: animation, curve: Curves.elasticInOut);

            return ScaleTransition(
              alignment: Alignment.center,
              scale: animation,
              child: child,
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
        );
}

/* Basically we are transferring all the code to this bouncy page route that
is basically  extends PageRouteBuilder that's why we are passing it in super
as to pass all the properties to actual PageRouteBuilder */
