import 'package:flutter/material.dart';
import 'package:task_medigreif_digital_health/common/app_box.dart';

class TitleContentBox extends StatelessWidget {
  final String title;
  final Widget child;

  const TitleContentBox({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return AppBox(
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 16.0),
          ),
          const SizedBox(height: 24.0),
          Align(alignment: Alignment.topLeft,child: child)
        ],
      ),
    );
  }
}
