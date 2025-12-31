import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../styles/app_styles.dart';

class ModernNavBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onMenuTap;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const ModernNavBar({
    super.key,
    required this.onMenuTap,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(TABLET);

    return Container(
      color: AppStyles.primaryColor,
      child: SafeArea(
        child: Container(
          height: kToolbarHeight,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                // ignore: deprecated_member_use
                color: AppStyles.secondaryColor.withOpacity(0.2),
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              if (!isDesktop) ...[
                IconButton(icon: const Icon(Icons.menu), onPressed: onMenuTap),
                const Spacer(),
              ],
              if (isDesktop) const SizedBox(width: 24),
              Text(
                'JASHN-E-FABRIC',
                style: AppStyles.headingSmall.copyWith(
                  fontSize: 24,
                  letterSpacing: 2,
                ),
              ),
              if (!isDesktop) const Spacer(),
              if (isDesktop) ...[
                const Spacer(),
                _buildDesktopMenu(),
                const SizedBox(width: 24),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopMenu() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _NavBarItem(
          title: 'HOME',
          isSelected: selectedIndex == 0,
          onTap: () => onDestinationSelected(0),
        ),
        _NavBarItem(
          title: 'PRODUCTS',
          isSelected: selectedIndex == 1,
          onTap: () => onDestinationSelected(1),
        ),
        _NavBarItem(
          title: 'ABOUT',
          isSelected: selectedIndex == 2,
          onTap: () => onDestinationSelected(2),
        ),
        _NavBarItem(
          title: 'CONTACT',
          isSelected: selectedIndex == 3,
          onTap: () => onDestinationSelected(3),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NavBarItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppStyles.secondaryColor : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
          style: AppStyles.buttonText.copyWith(
            color: isSelected ? AppStyles.secondaryColor : Colors.grey,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
