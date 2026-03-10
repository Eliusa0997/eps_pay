import 'package:flutter/material.dart';

class ItemIcon extends StatelessWidget {
  final String transactionType;
  const ItemIcon({super.key, required this.transactionType});

  @override
  Widget build(BuildContext context) {
    return _buildItemIcon(transactionType);
  }

  Widget _buildItemIcon(String transactionType) {
    switch (transactionType) {
      case "electricity":
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xFFFEF3C7),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.flash_on, size: 20, color: Color(0xFFF59E0B)),
        );
      case "water":
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xFFDEEDFF),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.water_drop, size: 20, color: Color(0xFF3B82F6)),
        );
      case "internet":
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xFFEDE9FE),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.wifi, size: 20, color: Color(0xFF8B5CF6)),
        );
      case "mobile_recharge":
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xFFEDE9FE),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.smartphone_sharp,
            size: 20,
            color: Color(0xFF8B5CF6),
          ),
        );
        // ignore: dead_code
        break;
      default:
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xFFEDE9FE),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.person, size: 20, color: Color(0xFF8B5CF6)),
        );
    }
  }
}
