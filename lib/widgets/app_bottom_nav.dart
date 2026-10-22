import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'nav_icon.dart';
import 'nav_item.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const _icons = [
    NavIcon.home,
    NavIcon.search,
    NavIcon.profile,
    NavIcon.settings,
  ];
  static const _labels = ['Home', 'Search', 'Profile', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.barBorder, width: 0.5)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              for (int i = 0; i < _icons.length; i++)
                Expanded(
                  child: NavItem(
                    icon: _icons[i],
                    label: _labels[i],
                    active: i == currentIndex,
                    onTap: () => onTap(i),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
