import 'package:eps_pay/core/routing/routes.dart' show Routes;
import 'package:flutter/material.dart';

final myCategories = [
  {
    'icon': Icons.flash_on,
    'label': 'Electricity',
    'color': const LinearGradient(
      colors: [Color(0xFFFBBF24), Color(0xFFF59E0B)],
    ),
    'providers': 2,
    'route': Routes.electricityScreen,
  },
  {
    'icon': Icons.water_drop,
    'label': 'Water',
    'color': const LinearGradient(
      colors: [Color(0xFF60A5FA), Color(0xFF3B82F6)],
    ),
    'providers': 2,
    'route': Routes.waterScreen,
  },
  {
    'icon': Icons.wifi,
    'label': 'Internet',
    'color': const LinearGradient(
      colors: [Color(0xFFA78BFA), Color(0xFF8B5CF6)],
    ),
    'providers': 3,
    'route': Routes.internetScreen,
  },
  {
    'icon': Icons.smartphone,
    'label': 'Mobile Recharge',
    'color': const LinearGradient(
      colors: [Color(0xFF34D399), Color(0xFF10B981)],
    ),
    'providers': 3,
    'route': Routes.mobileRechargeScreen,
  },
  {
    'icon': Icons.description,
    'label': 'Government',
    'color': const LinearGradient(
      colors: [Color(0xFFF87171), Color(0xFFEF4444)],
    ),
    'providers': 3,
    'route': Routes.internetScreen,
  },
  {
    'icon': Icons.business,
    'label': 'Other Services',
    'color': const LinearGradient(
      colors: [Color(0xFF9CA3AF), Color(0xFF6B7280)],
    ),
    'providers': 3,
    'route': Routes.waterScreen,
  },
];
