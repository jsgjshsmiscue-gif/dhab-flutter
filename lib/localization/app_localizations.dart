import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  // English Strings
  String get appTitle => locale.languageCode == 'ar' ? 'ذهب' : 'DHAB';
  String get welcomeTitle => locale.languageCode == 'ar' ? 'أهلا وسهلا' : 'Welcome';
  String get login => locale.languageCode == 'ar' ? 'تسجيل الدخول' : 'Login';
  String get signup => locale.languageCode == 'ar' ? 'إنشاء حساب' : 'Sign Up';
  String get email => locale.languageCode == 'ar' ? 'البريد الإلكتروني' : 'Email';
  String get password => locale.languageCode == 'ar' ? 'كلمة المرور' : 'Password';
  String get phoneNumber => locale.languageCode == 'ar' ? 'رقم الهاتف' : 'Phone Number';
  String get fullName => locale.languageCode == 'ar' ? 'الاسم الكامل' : 'Full Name';
  String get selectRideType => locale.languageCode == 'ar' ? 'اختر نوع الركوب' : 'Select Ride Type';
  String get requestRide => locale.languageCode == 'ar' ? 'طلب ركوب' : 'Request Ride';
  String get cancel => locale.languageCode == 'ar' ? 'إلغاء' : 'Cancel';
  String get confirm => locale.languageCode == 'ar' ? 'تأكيد' : 'Confirm';
  String get wallet => locale.languageCode == 'ar' ? 'المحفظة' : 'Wallet';
  String get settings => locale.languageCode == 'ar' ? 'الإعدادات' : 'Settings';
  String get profile => locale.languageCode == 'ar' ? 'الملف الشخصي' : 'Profile';
  String get logout => locale.languageCode == 'ar' ? 'تسجيل الخروج' : 'Logout';
  String get sos => locale.languageCode == 'ar' ? 'استغاثة' : 'SOS';
  String get rideHistory => locale.languageCode == 'ar' ? 'سجل الركوب' : 'Ride History';
  String get referral => locale.languageCode == 'ar' ? 'الإحالة' : 'Referral';
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return Future.value(AppLocalizations(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) {
    return false;
  }
}
