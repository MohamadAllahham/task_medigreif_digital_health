import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final int lines;
  final String? hintText;
  final bool shadowEffect;

  const AppTextField(
      {required this.controller,
        super.key,
        required this.lines,
        this.hintText,
        this.shadowEffect = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: shadowEffect
          ? BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      )
          : null,
      child: TextField(
        controller: controller,
        maxLines: lines,
        minLines: lines,
        decoration: InputDecoration(
          hintText: ' $hintText',
          filled: true,
          fillColor: Colors.white,
          hintStyle: theme.textTheme.bodyLarge,
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
        style: theme.textTheme.bodyLarge?.copyWith(color: theme.primaryColor),
      ),
    );
  }
}