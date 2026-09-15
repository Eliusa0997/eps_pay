import 'package:eps_pay/core/theming/colors.dart';
import 'package:eps_pay/features/settings/ui/widgets/header.dart';
import 'package:eps_pay/features/settings/ui/widgets/profile_card.dart';
import 'package:eps_pay/features/settings/ui/widgets/settings_sections.dart';
import 'package:flutter/material.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Sections
              Header(),

              // Profile Card Sections
              ProfileCard(),

              // Settings Sections
              SettingsSections(),
            ],
          ),
        ),
      ),
    );
  }
}
