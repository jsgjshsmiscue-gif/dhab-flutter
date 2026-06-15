class AppConstants {
  static const String appName = 'DHAB';
  static const String appNameAr = 'ذهب';
  static const String companyName = 'Mater Electric Cars';
  static const String appVersion = '1.0.0';
  static const String countryCode = '+962';
  static const String currency = 'JOD';
  
  // Ride Types
  static const Map<String, String> rideTypes = {
    'economy': 'DHAB Economy',
    'electric': 'DHAB Electric',
    'premium': 'DHAB Premium',
    'gold': 'DHAB Gold',
    'vip': 'DHAB VIP',
  };

  // Ride Prices per KM
  static const Map<String, double> ridePrices = {
    'economy': 0.25,
    'electric': 0.30,
    'premium': 0.35,
    'gold': 0.45,
    'vip': 0.60,
  };

  // Minimum Fare
  static const double minimumFare = 1.0;

  // Referral Reward
  static const double referralReward = 2.0;

  // Ride Status
  static const List<String> rideStatus = [
    'pending',
    'accepted',
    'arrived',
    'started',
    'completed',
    'cancelled',
  ];

  // Payment Methods
  static const List<String> paymentMethods = [
    'cash',
    'cliq',
    'wallet',
  ];

  // Firebase Collections
  static const String usersCollection = 'users';
  static const String driversCollection = 'drivers';
  static const String vehiclesCollection = 'vehicles';
  static const String ridesCollection = 'rides';
  static const String walletsCollection = 'wallets';
  static const String transactionsCollection = 'transactions';
  static const String messagesCollection = 'messages';
  static const String notificationsCollection = 'notifications';
  static const String ratingsCollection = 'ratings';
  static const String couponsCollection = 'coupons';
  static const String referralsCollection = 'referrals';
  static const String emergencyContactsCollection = 'emergency_contacts';
  static const String settingsCollection = 'settings';
}
