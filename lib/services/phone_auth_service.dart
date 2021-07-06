import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loadex_fleet_owner/globals/global_loader.dart';
import 'package:loadex_fleet_owner/screens/navigation_screen.dart';
import 'package:loadex_fleet_owner/screens/select_language_screen.dart';
class PhoneAuthService{
  handleAuth(){
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot){
          if(snapshot.hasData){
            return NavigationScreen(logout : false);
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return GlobalLoader();
          }else{
            // logout = true;
            return SelectLanguageScreen();
          }
        });
  }
  Signout(){
    FirebaseAuth.instance.signOut();
  }
}