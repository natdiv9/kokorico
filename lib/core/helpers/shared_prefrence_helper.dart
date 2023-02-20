import 'enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  SharedPreferenceHelper._internal();
  static final SharedPreferenceHelper _singleton =
      SharedPreferenceHelper._internal();

  factory SharedPreferenceHelper() {
    return _singleton;
  }

  Future<String?> getUserName() async {
    return (await SharedPreferences.getInstance())
        .getString(UserPreferenceKey.UserName.toString());
  }

  Future clearPreferenceValues() async {
    (await SharedPreferences.getInstance()).clear();
  }

  Future<void> setFirstTimeStatus(bool value) async {
    (await SharedPreferences.getInstance())
        .setBool(FisrtTime.FIRST_TIME.toString(), value);
  }

  Future<bool?> getFirstTimeStatus() async {
    return (await SharedPreferences.getInstance())
        .getBool(FisrtTime.FIRST_TIME.toString());
  }

  // Future<bool> saveUserProfile(UserModel user) async {
  //   return (await SharedPreferences.getInstance()).setString(
  //       UserPreferenceKey.UserProfile.toString(), json.encode(user.toJson()));
  // }

  // Future<UserModel?> getUserProfile() async {
  //   final String? jsonString = (await SharedPreferences.getInstance())
  //       .getString(UserPreferenceKey.UserProfile.toString());
  //   if (jsonString == null) return null;
  //   return UserModel.fromJson(json.decode(jsonString));
  // }

  // Future<bool> saveLinkMediaInfo(String key, LinkMediaInfo model) async {
  //   return (await SharedPreferences.getInstance())
  //       .setString(key, json.encode(model.toJson()));
  // }

  // Future<LinkMediaInfo?> getLinkMediaInfo(String key) async {
  //   final String? jsonString =
  //       (await SharedPreferences.getInstance()).getString(key);
  //   if (jsonString == null) {
  //     return null;
  //   }
  //   return LinkMediaInfo.fromJson(json.decode(jsonString));
  // }
}

enum UserPreferenceKey { AccessToken, UserProfile, UserName, IsFirstTimeApp }
