import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_medigreif_digital_health/common/adviser_avatar.dart';
import 'package:task_medigreif_digital_health/common/common_app_bar.dart';
import 'package:task_medigreif_digital_health/generated/app_localizations.dart';

class MoodCreatedScreen extends StatelessWidget {
  const MoodCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor:
          Color.lerp(Colors.white, theme.colorScheme.secondary, 0.3),
      appBar: CommonAppBar(
        walletAmount: 300,
        leadingTitle: localizations.activity,
        withBorderRadius: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AdviserAvatar(avatarRadius: height / 8),
            const SizedBox(height: 16.0),
            Text(
              localizations.moodSavedTitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: 16.0),
            Text.rich(
              TextSpan(
                style: theme.textTheme.labelLarge,
                children: [
                  TextSpan(text: localizations.moodSavedPart1),
                  TextSpan(
                    text: localizations.moodSavedBold,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),
            GestureDetector(
              onTap: () {
                context.go('/');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      localizations.thankYouBackToHome,
                      style: theme.textTheme.labelLarge
                          ?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(width: 4.0),
                    const Icon(Icons.check_circle, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
