import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_medigreif_digital_health/common/common_app_bar.dart';
import 'package:task_medigreif_digital_health/common/ui_models/nav_bar_button_model.dart';
import 'package:task_medigreif_digital_health/generated/app_localizations.dart';
import 'package:task_medigreif_digital_health/screens/main_screen/home.dart';

final _selectedIndexProvider = StateProvider<int>((ref) => 0);

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(_selectedIndexProvider);
    final localizations = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    final List<NavBarButtonModel> buttons = [
      NavBarButtonModel(
          content: const Home(), icon: Icons.home, title: localizations.home),
      NavBarButtonModel(
          content: Center(child: Text('Activity')),
          icon: Icons.directions_bike,
          title: localizations.activity),
      NavBarButtonModel(
          content: Center(child: Text('Nutrition')),
          icon: Icons.restaurant,
          title: localizations.nutrition),
      NavBarButtonModel(
          content: Center(child: Text('Health')),
          icon: Icons.favorite,
          title: localizations.health),
    ];

    return Scaffold(
      appBar: CommonAppBar(walletAmount: 300),
      body: buttons[selectedIndex].content,
      floatingActionButton: SizedBox(
        height: 64.0,
        width: 64.0,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: colorScheme.primary,
          elevation: 6.0,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, size: 24),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 64.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: (index) {
              ref.read(_selectedIndexProvider.notifier).state = index;
            },
            items: buttons.map((btn) => btn.toBottomNavItem()).toList(),
          ),
        ),
      ),
    );
  }
}
