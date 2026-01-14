import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final List<BottomBarItem> items;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final Color labelColor;
  final double height;
  final double iconSize;

  const CustomBottomBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.items,
    this.backgroundColor = const Color(0xFF2C2C2C),
    this.activeColor = const Color(0xFFE74C3C),
    this.inactiveColor = Colors.white,
    this.labelColor = Colors.white,
    this.height = 80,
    this.iconSize = 24,
  }) : assert(items.length > 0, 'Items cannot be empty'),
       super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          items.length,
          (index) => _buildBottomBarItem(
            item: items[index],
            isSelected: selectedIndex == index,
            onTap: () => onItemTapped(index),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBarItem({
    required BottomBarItem item,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            item.icon,
            size: iconSize,
            color: isSelected ? activeColor : inactiveColor,
          ),
          const SizedBox(height: 6),
          Text(
            item.label,
            style: TextStyle(
              fontSize: 11,
              color: labelColor,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomBarItem {
  final IconData icon;
  final String label;

  BottomBarItem({required this.icon, required this.label});
}
