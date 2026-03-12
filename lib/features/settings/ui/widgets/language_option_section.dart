import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';

class LanguageOptionSection extends StatelessWidget {
  final String label;
  final String flag;
  const LanguageOptionSection({
    super.key,
    required this.label,
    required this.flag,
  });

  @override
  Widget build(BuildContext context) {
    String _selectedLanguage = 'English';
    final isSelected = label.startsWith(_selectedLanguage);
    return InkWell(
      onTap: () {
        // setState(() {
        //   _selectedLanguage = label.split(' ').first;
        // });
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary.withOpacity(0.1)
                    : AppColors.background,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(flag, style: const TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.border,
                  width: 2,
                ),
                color: isSelected ? AppColors.primary : Colors.transparent,
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(Icons.circle, size: 8, color: Colors.white),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
