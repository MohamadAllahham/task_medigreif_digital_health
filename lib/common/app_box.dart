import 'package:flutter/material.dart';

class AppBox extends StatelessWidget {
  final Widget child;

  const AppBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: child,
    );
  }
}
