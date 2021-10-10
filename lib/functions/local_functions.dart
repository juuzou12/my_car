import 'package:shared_preferences/shared_preferences.dart';

class local_functions {

  /*setting the user mode from user to business...*/
  void changeUserMode(String userMode)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userMode=prefs.getString('userMode').toString();
    switch(userMode){
      case "userMode":
        userMode='userMode';
        prefs.setString('userMode', "userMode");
        break;
      case "businessMode":
        userMode='businessMode';
        prefs.setString('userMode', "businessMode");
        break;
    }
  }
  /*setting the user mode from business to user...*/
  void settingUserMode(String userMode)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userMode', userMode);
  }
}