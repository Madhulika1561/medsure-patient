

import 'package:medsure_patient/helper/sharedPrefernce/prefernce_content.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreference {

  static SharedPreferences? preferences;

  static Future init() async=>
      preferences = await SharedPreferences.getInstance();


  /// set user name
   static Future setUserFirstName(String value) async=> await preferences?.setString(PreferenceConstants.keyUserFirstName, value);
   /// get user name
   static Future<String?> getUserFirstName() async=> preferences?.getString(PreferenceConstants.keyUserFirstName)??"";

   ///set user last name
   static Future setUserLastName(String value) async=> await preferences?.setString(PreferenceConstants.keyUserLastName, value);
   ///get user last name
   static Future<String?> getUserLastName() async=> preferences?.getString(PreferenceConstants.keyUserLastName)??"";

   ///set user email
   static Future setUserEmail(String value) async => await preferences?.setString(PreferenceConstants.keyUserEmail, value);
   /// get user email
   static Future<String?> getUserEmail() async => preferences?.getString(PreferenceConstants.keyUserEmail) ?? "";

  ///set user mobile number
  static Future setUserMobileNum(int value) async => await preferences?.setInt(PreferenceConstants.keyUserMobile, value);
  /// get user mobile number
  static Future<int?> getUserMobileNum() async => preferences?.getInt(PreferenceConstants.keyUserMobile) ?? 0;

  ///set user gender type
  static Future setUserGender(String value) async => await preferences?.setString(PreferenceConstants.keyUserGender, value);
  /// get user gender type
  static Future<String?> getUserGender() async => preferences?.getString(PreferenceConstants.keyUserGender) ?? "";


  ///set user DOB
  static Future setUserDOB(String value) async => await preferences?.setString(PreferenceConstants.keyUserDate, value);
  /// get user DOB
  static Future<String?> getUserDOB() async => preferences?.getString(PreferenceConstants.keyUserDate) ?? "";

  ///set user address
  static Future setUserAddress(String value) async => await preferences?.setString(PreferenceConstants.keyUserAddress, value);
  /// get user address
  static Future<String?> getUserAddress() async => preferences?.getString(PreferenceConstants.keyUserAddress) ?? "";


  ///set user city
  static Future setUserCity(String value) async => await preferences?.setString(PreferenceConstants.keyUserCity, value);
  /// get user city
  static Future<String?> getUserCity() async => preferences?.getString(PreferenceConstants.keyUserCity) ?? "";

  ///set user pincode
  static Future setUserPinCode(int value) async => await preferences?.setInt(PreferenceConstants.keyUserPinCode, value);
  /// get user pin code
  static Future<int?> getUserPinCode() async => preferences?.getInt(PreferenceConstants.keyUserPinCode) ?? 0;

  ///set user id
  static Future setUserId(int value) async => await preferences?.setInt(PreferenceConstants.keyUserId, value);
  /// get user id
  static Future<int?> getUserId() async => preferences?.getInt(PreferenceConstants.keyUserId) ?? 0;

  ///set user state
  static Future setUserState(String value) async => await preferences?.setString(PreferenceConstants.keyUserState, value);
  /// get user state
  static Future<String?> getUserState() async => preferences?.getString(PreferenceConstants.keyUserState) ?? "";

  ///set user Country
  static Future setUserCountry(String value) async => await preferences?.setString(PreferenceConstants.keyUserCountry, value);
  /// get user Country
  static Future<String?> getUserCountry() async => preferences?.getString(PreferenceConstants.keyUserCountry) ?? "";


  ///isLogged
  static Future setUserIsLogged(bool value) async => await preferences?.setBool(PreferenceConstants.keyIsLogged, value);
  static Future<bool?> getUserIsLogged() async => preferences?.getBool(PreferenceConstants.keyIsLogged) ?? false;


  static  clearData() async{
    preferences?.clear();
    preferences?.commit();
  }
}