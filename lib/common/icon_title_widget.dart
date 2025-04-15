import 'package:flutter/material.dart';

class IconTitleWidget extends StatelessWidget {
  final IconData iconData;
  final String title;
  final bool titleFirst;
  final double iconSize;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final Color? iconColor;

  const IconTitleWidget(
      {super.key,
      required this.iconData,
      required this.title,
      this.titleFirst = false,
      this.onTap,
      this.textStyle,
      this.iconSize = 36.0,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final List<Widget> children = [
      Icon(iconData, size: iconSize, color: iconColor),
      SizedBox(width: iconSize / 2),
      Text(
        title,
        style: textStyle ?? textTheme.titleLarge?.copyWith(fontSize: 20.0),
      )
    ];
    return GestureDetector(
      onTap: onTap,
      child: Row(
          children:
              titleFirst ? children.reversed.toList() : children.toList()),
    );
  }
}
