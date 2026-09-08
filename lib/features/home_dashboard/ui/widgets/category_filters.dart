import 'package:eps_pay/core/theming/colors.dart';
import 'package:eps_pay/features/home_dashboard/ui/widgets/build_filter_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryFilters extends StatelessWidget {
  const CategoryFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const Icon(
              Icons.filter_list,
              color: AppColors.textSecondary,
              size: 20,
            ),
            const SizedBox(width: 12),
            buildFilterChip('All', 'all'),
            const SizedBox(width: 8),
            buildFilterChip('Sent', 'sent'),
            const SizedBox(width: 8),
            buildFilterChip('Received', 'received'),
            const SizedBox(width: 8),
            buildFilterChip('Bills', 'bills'),
          ],
        ),
      ),
    );
  }
}
