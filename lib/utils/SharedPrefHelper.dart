import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {


  setData(key,value) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
  getData(key) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString(key);
  }
}