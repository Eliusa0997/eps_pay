// Helper class to manage onboarding state
//
// To use this with actual persistence:
// 1. Add shared_preferences to pubspec.yaml:
//    dependencies:
//      shared_preferences: ^2.2.2
//
// 2. Run: flutter pub get
//
// 3. Uncomment the code below and update splash_screen.dart

/*
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingHelper {
  static const String _onboardingCompleteKey = 'onboarding_complete';

  /// Check if user has completed onboarding
  static Future<bool> hasCompletedOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardingCompleteKey) ?? false;
  }

  /// Mark onboarding as completed
  static Future<void> setOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingCompleteKey, true);
  }

  /// Reset onboarding (for testing purposes)
  static Future<void> resetOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_onboardingCompleteKey);
  }

  /// Check if this is first app launch
  static Future<bool> isFirstLaunch() async {
    return !(await hasCompletedOnboarding());
  }
}
*/

// Mock implementation (no persistence - always shows onboarding)
class OnboardingHelper {
  static Future<bool> hasCompletedOnboarding() async {
    // For now, always return false to show onboarding
    // Change to true to skip onboarding and go directly to login
    return false;
  }

  static Future<void> setOnboardingComplete() async {
    // Mock implementation - does nothing
    // Implement with shared_preferences for real persistence
  }

  static Future<void> resetOnboarding() async {
    // Mock implementation - does nothing
  }

  static Future<bool> isFirstLaunch() async {
    return !(await hasCompletedOnboarding());
  }
}
