# Bankak - Modern Mobile Banking App

A professional, modern mobile banking application built with Flutter for Android and iOS. Inspired by Bank of Khartoum (Bankak) with enhanced UI/UX following Material 3 design principles.

## 📱 Features

### Implemented Screens
1. **Splash Screen** - Animated logo with auto-redirect to login
2. **Login Screen** - Phone/PIN authentication with biometric option
3. **Home Dashboard** - Account balance, quick actions, recent transactions
4. **Accounts Screen** - Multiple account management (Savings, Current, USD)
5. **Transfer Money** - Own accounts, bank transfers, phone number transfers
6. **Bills & Payments** - Electricity, water, internet, mobile recharge, government services
7. **Cards Screen** - Virtual card display with freeze/limits management
8. **Transaction History** - Searchable, filterable transaction list
9. **Profile & Settings** - Personal info, PIN management, language selection, logout

### Key Features
- ✅ Material 3 Design
- ✅ Clean, professional banking UI
- ✅ Trust-focused color scheme (Deep Blue/Teal)
- ✅ Large touch targets for accessibility
- ✅ Clear visual hierarchy
- ✅ Mock data for realistic demonstration
- ✅ Smooth animations and transitions
- ✅ Bilingual support ready (English & Arabic)
- ✅ Dark mode ready (theme system in place)

## 🎨 Design System

### Colors
- **Primary**: `#0A5F7D` (Deep Blue)
- **Secondary**: `#0D8BB3` (Teal)
- **Background**: `#F9FAFB` (Light Gray)
- **Success**: `#10B981` (Green)
- **Error**: `#EF4444` (Red)
- **Warning**: `#F59E0B` (Amber)

### Typography
- System default (can be customized to SF Pro Display or custom font)
- Clear hierarchy with appropriate font weights

### Components
- Rounded cards (16px border radius)
- Gradient buttons and headers
- Shadow elevations for depth
- Consistent spacing system

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / Xcode for mobile development
- VS Code or Android Studio IDE

### Installation

1. **Navigate to the Flutter project directory**
   ```bash
   cd flutter
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # For Android
   flutter run

   # For iOS (macOS only)
   flutter run -d ios

   # For web (development)
   flutter run -d chrome
   ```

### Building for Production

```bash
# Android APK
flutter build apk --release

# Android App Bundle (for Play Store)
flutter build appbundle --release

# iOS (macOS only)
flutter build ios --release
```

## 📁 Project Structure

```
flutter/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── constants/
│   │   └── colors.dart          # Color constants
│   ├── models/
│   │   ├── account.dart         # Account model
│   │   └── transaction.dart     # Transaction model
│   ├── screens/
│   │   ├── splash_screen.dart
│   │   ├── login_screen.dart
│   │   ├── home_dashboard.dart
│   │   ├── accounts_screen.dart
│   │   ├── transfer_money_screen.dart
│   │   ├── bills_payments_screen.dart
│   │   ├── cards_screen.dart
│   │   ├── transaction_history_screen.dart
│   │   └── profile_settings_screen.dart
│   └── widgets/                 # Reusable widgets (add as needed)
├── pubspec.yaml                 # Dependencies
└── README.md                    # This file
```

## 🔧 Customization

### Adding Custom Fonts
1. Create a `fonts/` folder in the project root
2. Add your font files (.ttf or .otf)
3. Uncomment and update the fonts section in `pubspec.yaml`
4. Run `flutter pub get`

### Adding Assets
1. Create an `assets/` folder with subdirectories:
   - `assets/images/`
   - `assets/icons/`
2. Uncomment the assets section in `pubspec.yaml`
3. Add your asset paths
4. Run `flutter pub get`

### Connecting to Backend API

To connect to a real backend:

1. Uncomment network dependencies in `pubspec.yaml`:
   ```yaml
   http: ^1.1.2
   # or
   dio: ^5.4.0
   ```

2. Create API service files:
   ```dart
   lib/
   ├── services/
   │   ├── api_service.dart
   │   ├── auth_service.dart
   │   └── transaction_service.dart
   ```

3. Add environment variables for API endpoints
4. Implement authentication token management
5. Replace mock data with API calls

### Adding State Management

For production apps, consider adding state management:

**Option 1: Provider**
```yaml
dependencies:
  provider: ^6.1.1
```

**Option 2: Riverpod**
```yaml
dependencies:
  flutter_riverpod: ^2.4.9
```

**Option 3: Bloc**
```yaml
dependencies:
  flutter_bloc: ^8.1.3
```

### Adding Local Storage

For persisting user data:

```yaml
dependencies:
  shared_preferences: ^2.2.2  # Simple key-value storage
  hive: ^2.2.3                # NoSQL database
  hive_flutter: ^1.1.0
```

## 🌐 Localization (Arabic Support)

To add Arabic language support:

1. Add the intl package:
   ```yaml
   dependencies:
     flutter_localizations:
       sdk: flutter
     intl: ^0.18.1
   ```

2. Create localization files:
   ```
   lib/l10n/
   ├── app_en.arb
   └── app_ar.arb
   ```

3. Update `MaterialApp` in `main.dart`:
   ```dart
   MaterialApp(
     localizationsDelegates: [
       GlobalMaterialLocalizations.delegate,
       GlobalWidgetsLocalizations.delegate,
       GlobalCupertinoLocalizations.delegate,
     ],
     supportedLocales: [
       Locale('en', ''),
       Locale('ar', ''),
     ],
     // ...
   )
   ```

## 🔐 Security Considerations

For production deployment:

1. **Never hardcode sensitive data** (API keys, secrets)
2. **Use secure storage** for tokens and credentials:
   ```yaml
   flutter_secure_storage: ^9.0.0
   ```
3. **Implement SSL pinning** for API calls
4. **Add biometric authentication**:
   ```yaml
   local_auth: ^2.1.7
   ```
5. **Obfuscate code** when building release versions
6. **Enable ProGuard** (Android) and code shrinking

## 📱 Target Devices

- **Android**: API 21+ (Android 5.0 Lollipop and above)
- **iOS**: iOS 12.0 and above
- **Screen sizes**: Optimized for phones (3.5" to 7")

## 🎯 Next Steps

- [ ] Connect to real banking API
- [ ] Implement biometric authentication
- [ ] Add proper error handling and validation
- [ ] Implement state management (Provider/Riverpod/Bloc)
- [ ] Add unit and widget tests
- [ ] Implement Arabic language support (RTL)
- [ ] Add push notifications
- [ ] Implement offline mode with local caching
- [ ] Add analytics and crash reporting
- [ ] Security hardening (SSL pinning, code obfuscation)

## 📄 License

This is a demonstration project. For production use, ensure compliance with banking regulations and obtain necessary licenses.

## 👨‍💻 Development Notes

- All mock data is located in individual screen files
- Navigation is handled using named routes
- The app uses Material 3 design system
- Colors are centralized in `lib/constants/colors.dart`
- Each screen is self-contained for easy modification

## 🐛 Known Issues

- This is a UI/UX prototype with mock data
- No real authentication or API integration
- No data persistence (data resets on app restart)
- Biometric authentication button is non-functional (UI only)

## 📞 Support

For questions or issues, please contact your development team or create an issue in your project repository.

---

**Built with ❤️ using Flutter**
