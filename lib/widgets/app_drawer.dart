import 'package:flutter/material.dart';
import '../styles/app_styles.dart';

class AppDrawer extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const AppDrawer({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppStyles.secondaryColor),
            child: Center(
              child: Text(
                'JASHN-E-FABRIC',
                style: AppStyles.headingSmall.copyWith(
                  color: AppStyles.primaryColor,
                  fontSize: 24,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.home_outlined,
            title: 'Home',
            index: 0,
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.layers_outlined,
            title: 'Products',
            index: 1,
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.favorite_border,
            title: 'About',
            index: 2,
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.phone_outlined,
            title: 'Contact',
            index: 3,
          ),
          // const Spacer(),
          // const Divider(),
          // ListTile(
          //   leading: const Icon(Icons.shopping_bag_outlined),
          //   title: const Text('Cart'),
          //   onTap: () {
          //     // TODO: Implement cart functionality

          //     Navigator.pop(context);
          //   },
          // ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required int index,
  }) {
    final isSelected = selectedIndex == index;

    return ListTile(
      leading: Icon(icon, color: isSelected ? AppStyles.secondaryColor : null),
      title: Text(
        title,
        style: AppStyles.bodyMedium.copyWith(
          color: isSelected ? AppStyles.secondaryColor : null,
          fontWeight: isSelected ? FontWeight.bold : null,
        ),
      ),
      selected: isSelected,
      onTap: () {
        onDestinationSelected(index);
        Navigator.pop(context);
      },
    );
  }
}
