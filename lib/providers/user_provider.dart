import 'package:flutter/foundation.dart';

/// UserProvider class for managing user-related state
/// 
/// This provider uses ChangeNotifier to manage and notify UI changes
/// when user data is updated. Used with Provider package for state management.
class UserProvider extends ChangeNotifier {
  // Default location/district
  String _district = 'Colombo';

  /// Get the currently selected district
  String get district => _district;

  /// Update the district and notify all listeners
  /// 
  /// Parameters:
  /// - newDistrict: The new district value to set
  /// 
  /// This method calls notifyListeners() to instantly update the UI
  /// with the new district value
  void updateDistrict(String newDistrict) {
    _district = newDistrict;
    
    // Call this to instantly update the UI
    notifyListeners();
  }
}