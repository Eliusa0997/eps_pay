import 'package:eps_pay/features/settings/ui/widgets/app_version_section.dart';
import 'package:eps_pay/features/settings/ui/widgets/language_option_section.dart';
import 'package:eps_pay/features/settings/ui/widgets/logout_button.dart';
import 'package:eps_pay/features/settings/ui/widgets/settings_card.dart';
import 'package:eps_pay/features/settings/ui/widgets/settings_item_section.dart';
import 'package:eps_pay/features/settings/ui/widgets/settings_title_section.dart';
import 'package:flutter/material.dart';

class SettingsSections extends StatelessWidget {
  const SettingsSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SettingsTitelSection(title: 'Account'),

          const SizedBox(height: 12),

          SettingsCard(
            children: [
              SettingsItemSection(
                icon: Icons.person,
                label: 'Personal Information',
                iconColor: const Color(0xFF3B82F6),
                bgColor: const Color(0xFFDEEDFF),
              ),
              SettingsItemSection(
                icon: Icons.lock,
                label: 'Change PIN',
                iconColor: const Color(0xFF8B5CF6),
                bgColor: const Color(0xFFEDE9FE),
              ),
              SettingsItemSection(
                icon: Icons.security,
                label: 'Security Settings',
                iconColor: const Color(0xFF10B981),
                bgColor: const Color(0xFFD1FAE5),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const SettingsTitelSection(title: 'Preferences'),
          const SizedBox(height: 12),
          SettingsCard(
            children: [
              SettingsItemSection(
                icon: Icons.language,
                label: 'Language',
                iconColor: const Color(0xFFF97316),
                bgColor: const Color(0xFFFFEDD5),
              ),
              SettingsItemSection(
                icon: Icons.notifications,
                label: 'Notifications',
                iconColor: const Color(0xFFFBBF24),
                bgColor: const Color(0xFFFFEDD5),
              ),
            ],
          ),
          const SizedBox(height: 12),

          const SizedBox(height: 24),
          const SettingsTitelSection(title: 'Support'),
          const SizedBox(height: 12),
          SettingsCard(
            children: [
              SettingsItemSection(
                icon: Icons.help,
                label: 'Help & Support',
                iconColor: const Color(0xFF14B8A6),
                bgColor: const Color(0xFFCCFBF1),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const SettingsTitelSection(title: 'Select Language'),
          const SizedBox(height: 12),

          // Language Section
          SettingsCard(children: [LanguageOptionSection()]),
          const SizedBox(height: 24),

          // Logout Button
          const LogoutButtonSection(),

          const SizedBox(height: 24),

          // App Version
          const AppVersionSection(),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
