import 'package:flutter/material.dart';

class TSettingsMenuTile extends StatelessWidget {
  const TSettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: TColors.primary,
      ),
      title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
