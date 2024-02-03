import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPreference {




  Future setUID(String uID) async{
    SharedPreferences  prefs = await SharedPreferences.getInstance();
    prefs.setString('keyUID', uID);
  }

  static getUID(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? uIDValue =  prefs.getString(key);
    print('KEY ${prefs.getString('keyUID')}');
    return uIDValue;
  }


}