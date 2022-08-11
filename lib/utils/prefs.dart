import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static String userIDKey = 'USERIDKEY';
  static String fullNameKey = 'FULLNAMEKEY';
  static String nickNameKey = "NICKNAMEKEY";
  static String displayNameKey = 'DISPLAYNAMEKEY';
  static String userEmailKey = 'USEREMAILKEY';
  static String phoneNumKey = 'PHONENUMKEY';
  static String userGenderKey = 'USERGENDERKEY';
  static String userAgeKey = 'USERAGEKEY';
  static String userJobKey = 'USERJOBKEY';
  static String userCityKey = 'USERCITYKEY';

  //save data
  Future<bool> saveUserID(String getUserID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIDKey, getUserID);
  }

  Future<bool> saveFullName(String getFullName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(fullNameKey, getFullName);
  }

  Future<bool> saveNickName(String getNickName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(nickNameKey, getNickName);
  }

  Future<bool> saveDisplayName(String? getDisplayName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (getDisplayName != null) {
      return prefs.setString(displayNameKey, getDisplayName);
    } else {
      return prefs.setString(displayNameKey, "errror");
    }
  }

  Future<bool> saveEmail(String? getEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (getEmail != null) {
      return prefs.setString(userEmailKey, getEmail);
    } else {
      return prefs.setString(userEmailKey, "Error");
    }
  }

  Future<bool> savePhoneNum(String getPhoneNum) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(phoneNumKey, getPhoneNum);
  }

  Future<bool> saveGender(String getGender) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userGenderKey, getGender);
  }

  Future<bool> saveAge(String getAge) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userAgeKey, getAge);
  }

  Future<bool> saveJob(String getJob) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userJobKey, getJob);
  }

  Future<bool> saveCity(String getCity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userCityKey, getCity);
  }

  //get data
  Future<String?> getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIDKey);
  }

  Future<String?> getFullName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(fullNameKey);
  }

  Future<String?> getNickName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(nickNameKey);
  }

  Future<String?> getDisplayName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(displayNameKey);
  }

  Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }

  Future<String?> getPhoneNum() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(phoneNumKey);
  }

  Future<String?> getGender() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userGenderKey);
  }

  Future<String?> getAge() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userAgeKey);
  }

  Future<String?> getJob() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userJobKey);
  }

  Future<String?> getCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userCityKey);
  }
}
