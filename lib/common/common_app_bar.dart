import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int walletAmount;
  final VoidCallback? onChatPressed;
  final VoidCallback? onCalendarPressed;
  final String? leadingTitle;
  final VoidCallback? onLeadingTapped;
  final bool withBorderRadius;

  const CommonAppBar({
    super.key,
    required this.walletAmount,
    this.onChatPressed,
    this.onCalendarPressed,
    this.leadingTitle,
    this.onLeadingTapped,
    this.withBorderRadius = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(withBorderRadius ? 16.0 : 0),
      child: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        actions: [
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.orange, Colors.yellow],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.account_balance_wallet,
                  color: Colors.white,
                ),
                const SizedBox(width: 4.0),
                Text(
                  '$walletAmount',
                  style: TextStyle(
                    color: colorScheme.surface,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.chat_outlined, color: colorScheme.onSurface),
            onPressed: onChatPressed,
          ),
          IconButton(
            icon: Icon(Icons.calendar_today_outlined,
                color: colorScheme.onSurface),
            onPressed: onCalendarPressed,
          ),
        ],
        title: leadingTitle == null
            ? null
            : Text(
                leadingTitle!,
                style: theme.textTheme.titleLarge?.copyWith(fontSize: 20.0),
              ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
