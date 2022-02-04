import 'package:flutter/cupertino.dart';

class ScaleAnimation extends PageRouteBuilder {
  final Widget widget;

  ScaleAnimation({required this.widget})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              widget,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}

/* Basically we are transferring all the code to this bouncy page route that
is basically  extends PageRouteBuilder that's why we are passing it in super
as to pass all the properties to actual PageRouteBuilder */
