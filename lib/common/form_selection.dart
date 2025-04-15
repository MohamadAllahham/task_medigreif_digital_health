import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_medigreif_digital_health/common/icon_title_widget.dart';
import 'package:task_medigreif_digital_health/common/ui_models/selector_model.dart';

class FormSelection extends ConsumerWidget {
  final List<SelectorModel> selectors;
  final StateProvider<List<int>> provider;

  const FormSelection({
    required this.selectors,
    required this.provider,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndices = ref.watch(provider);
    final theme = Theme.of(context);

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        ...List.generate(selectors.length, (index) {
          final isSelected = selectedIndices.contains(index);
          final notifier = ref.read(provider.notifier);

          return GestureDetector(
            onTap: () {
              final updated = [...selectedIndices];
              if (isSelected) {
                updated.remove(index);
              } else {
                updated.add(index);
              }
              notifier.state = updated;
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: isSelected ? theme.primaryColor : Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: IconTitleWidget(
                    iconData: selectors[index].iconData,
                    iconColor: isSelected ? Colors.white : Colors.black,
                    title: selectors[index].title,
                    iconSize: 18.0,
                    textStyle: theme.textTheme.bodyMedium?.copyWith(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: 6.0, horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Icon(Icons.add_circle_outline),
        ),
      ],
    );
  }
}
