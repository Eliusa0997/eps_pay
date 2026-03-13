import 'package:easy_localization/easy_localization.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';

class LanguageOptionSection extends StatefulWidget {
  const LanguageOptionSection({super.key});

  @override
  State<LanguageOptionSection> createState() => _LanguageOptionSectionState();
}

String _selectedLanguage = 'English';

class _LanguageOptionSectionState extends State<LanguageOptionSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildLanguageOption('English', '🇬🇧'),
          Divider(height: 1),
          _buildLanguageOption('العربية (Arabic)', '🇸🇩'),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(String label, String flag) {
    final isSelected = label.startsWith(_selectedLanguage);
    return InkWell(
      onTap: () {
        setState(() {
          _selectedLanguage = label.split(' ').first;
          if (_selectedLanguage == 'English') {
            context.setLocale(Locale('en'));
            print("english choosen");
          } else {
            context.setLocale(Locale('ar'));
            print("Arbic choosen");
          }
        });
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
