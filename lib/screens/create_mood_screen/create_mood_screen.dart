import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_medigreif_digital_health/common/common_app_bar.dart';
import 'package:task_medigreif_digital_health/common/icon_title_widget.dart';
import 'package:task_medigreif_digital_health/generated/app_localizations.dart';
import 'package:task_medigreif_digital_health/models/mood/create_mood_request_body.dart';
import 'package:task_medigreif_digital_health/models/mood/mood_type.dart';
import 'package:task_medigreif_digital_health/providers/mood/mood_provider.dart';
import 'package:task_medigreif_digital_health/providers/user/user_provider.dart';
import 'package:task_medigreif_digital_health/screens/create_mood_screen/providers.dart';

import 'create_mood_step_one.dart';
import 'create_mood_step_two.dart';

class CreateMoodScreen extends ConsumerWidget {
  final MoodType moodType;

  const CreateMoodScreen(this.moodType, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    final currentMoodType = ref.watch(moodTypeProvider);
    final selectedIndex = ref.watch(stepIndex);
    final moodState = ref.watch(moodProvider);

    final List<Widget> steps = [CreateMoodStepOne(), CreateMoodStepTwo()];

    if (currentMoodType == null) {
      Future.microtask(() {
        ref.read(moodTypeProvider.notifier).state = moodType;
      });
    }

    return Stack(
      children: [
        Scaffold(
          appBar: CommonAppBar(
            walletAmount: 300,
            leadingTitle: localizations.mood,
            withBorderRadius: true,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: List.generate(
                      steps.length,
                      (index) => Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            right: index < steps.length - 1 ? 4.0 : 0,
                          ),
                          height: 5,
                          decoration: BoxDecoration(
                            color: index <= selectedIndex
                                ? theme.primaryColor
                                : Colors.grey.shade400,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: steps[selectedIndex],
                )
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 64.0,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF000000).withAlpha((0.2 * 255).toInt()),
                  blurRadius: 12,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: selectedIndex > 0 ? 1.0 : 0.1,
                  child: IconTitleWidget(
                    iconData: Icons.arrow_back_outlined,
                    title: localizations.back,
                    onTap: selectedIndex > 0
                        ? () {
                            ref.read(stepIndex.notifier).state =
                                selectedIndex - 1;
                          }
                        : null,
                  ),
                ),
                IconTitleWidget(
                  iconData: Icons.arrow_forward_outlined,
                  title: selectedIndex == steps.length - 1
                      ? localizations.complete
                      : localizations.next,
                  titleFirst: true,
                  onTap: () async {
                    if (selectedIndex < steps.length - 1) {
                      ref.read(stepIndex.notifier).state++;
                      return;
                    }

                    final moodType = ref.read(moodTypeProvider);
                    final user = ref.read(userProvider).user;

                    if (moodType == null || user == null) {
                      _showSnackBar(context, localizations.errorGeneric);
                      return;
                    }

                    final body = CreateMoodRequestBody(
                      moodType: moodType.name,
                      userId: user.id.toString(),
                      note: ref.read(noteControllerProvider).text,
                    );

                    await ref.read(moodProvider.notifier).createMood(body);

                    final error = ref.read(moodProvider).errorMessage;
                    if (!context.mounted) return;

                    _showSnackBar(
                      context,
                      error ?? localizations.successMoodCreated,
                    );

                    if (error == null) context.push('/mood-created');
                  },
                ),
              ],
            ),
          ),
        ),
        if (moodState.isLoading)
          Container(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
