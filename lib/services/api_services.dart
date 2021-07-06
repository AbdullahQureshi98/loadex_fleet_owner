import 'package:loadex_fleet_owner/globals/constants.dart';
import 'package:loadex_fleet_owner/globals/variables.dart';
import 'package:loadex_fleet_owner/models/Login_Response.dart';
import 'package:loadex_fleet_owner/models/Register_Response.dart';
import 'package:loadex_fleet_owner/models/Standard_Response.dart';
import 'package:http/http.dart' as http;

class LoginServices{
  String firebaseUserId;
  String appId;
  LoginServices({this.firebaseUserId, this.appId});
  //String url = Global_URL_SSO + "auth/login";
  String url = kGlobal_URL_SSO + "login";

  Future<String> getAccessToken()async{
    try{
      var response = await http.post(url, body: {
        "firebaseId" : firebaseUserId,
        'appId' : appId,
      });
      print('I am login post call response');
      print(response.body);

      var res = responseFromJson(response.body);
      if(res.status == true){
        final login = loginFromJson(response.body);
        vloggedInUserInfo = login;

        return login.accesstoken;
      }else{
        return null;
      }
    }catch(e){
      print(e);
    }
  }
}

class RegisterServices{
  String firebaseId;
  String userName;
  //String contactNumber;
  int cnicNumber;
  // String licenseNumber;
  // DateTime licenseIssueDate;
  // DateTime licenseExpiryDate;
  RegisterServices({this.firebaseId,this.userName,this.cnicNumber,});
  String url = kGlobal_URL_SSO + "register";
  Future<bool> registrationStatus()async{
    try{
      var response = await http.post(url, body: {
        //"user_id": firebaseId
        "firebaseId": firebaseId,
        "name" : userName,
        "CNIC": cnicNumber.toString(),
      });

      print(response.body);
      if(response.statusCode == 200){
        final register = registerFromJson(response.body);
        return register.status;
      }else{
        return false;
      }
    }catch(e){
      print(e);
    }
  }
}
