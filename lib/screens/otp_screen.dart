import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loadex_fleet_owner/globals/constants.dart';
import 'package:loadex_fleet_owner/globals/global_loader.dart';
import 'package:loadex_fleet_owner/services/api_services.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:toast/toast.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  OtpScreen({this.phoneNumber});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool activate_button = false;
  //int Seconds=59;
  bool load=false;
  String thePin;

  final codeController = TextEditingController();
  int _counter = 59;
  Timer _timer;
  void startTimer(){
    setState(() {
      activate_button = false;
    });
    _counter = 59;
    if(_timer != null){
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(mounted){
        setState(() {
          if(_counter > 0){
            _counter--;
          }else{
            _timer.cancel();
            activate_button = true;
          }

        });}
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    _VerifyPhoneNumber();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return load==true?GlobalLoader():Container(

        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  Image.asset(
                    "assets/images/png/LOADEX.png",
                    height: 25,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter PIN Code',
                        style: TextStyle(
                            fontFamily: 'Geomanist',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3A3A3A)),
                      )
                    ],
                  ),
                  Center(child: Text( _counter > 0 ? '00:'+ _counter.toString() : '00:00' , style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PinEntryTextField(
                        fields: 6,
                        onSubmit: (String pin)async {

                          try{

                            setState(() {
                              load = true;
                            });
                            AuthCredential credential = PhoneAuthProvider.credential(verificationId: thePin, smsCode: pin);

                            UserCredential result = await FirebaseAuth.instance.signInWithCredential(credential);
                            User user = result.user;
                            // Return non-null user if credentials are valid
                            print(user.toString());
                            if(user != null){

                              print(user.phoneNumber);

                              User firebaseUser = await FirebaseAuth.instance.currentUser;

                              kGlobal_Access_Token = await LoginServices(
                                firebaseUserId: firebaseUser.uid.toString(),
                                appId: kGlobal_appId,
                              ).getAccessToken();

                              print(
                                  "this is the access token at cnic screen" +
                                      kGlobal_Access_Token
                                          .toString());

                              if(kGlobal_Access_Token == null){
                                print('no user in API');

                                Timer(Duration(seconds: 1),()=> setState(() {
                                  load = false;
                                  // Navigator.pushReplacement(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => QRViewExample(contactNumber: widget.phoneNumber,)),
                                  // );
                                }));
                              }
                              else{
                                //DriverInfo = await GetDriverInfoByToken(accessToken: Global_Access_Token).GetDriverInfoByTokenFunction();
                                Timer(Duration(seconds: 1),()=> setState(() {
                                  load = false;
                                  // Navigator.of(context)
                                  //     .pushAndRemoveUntil(
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             NavScreen()),
                                  //         (Route<dynamic> route) =>
                                  //     false);
                                }));
                              }
                            }
                            else{
                              print("Error: Invalid Pin -> pin_screen.dart, line 184");
                            }
                          }catch(e){
                            print(e);
                            FocusScope.of(context).unfocus();
                            Toast.show("Invalid OTP Code", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM,backgroundColor: Color(0xff4C76CC),textColor: Colors.white,);
                            if(mounted){
                              setState(() {
                                load = false;
                              });
                            }
                            // temp lines of code, removed as soon as possible
                            //   Timer(Duration(seconds: 2),()=> setState(() {
                            //     load = false;
                            //     Navigator.pop(context);
                            //   }));
                          }
                          //end showDialog()
                        }, // end onSubmit
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: Align(
                        alignment: Alignment(0.6,0),
                        child: InkWell(
                            onTap: () {
                              if (activate_button == false) {
                              } else if (activate_button == true) {
                                startTimer();
                              }
                            },
                            child: Text('Resend PIN',style: TextStyle(fontFamily: 'Geomanist',color: activate_button == true ? Color(0xff4C76CC) :Colors.black,fontSize: 16,fontWeight: FontWeight.bold, decoration: activate_button == true ? TextDecoration.underline : TextDecoration.none,),))),
                  ),

                  Row(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                    )
                  ]),
                ]),
          ),
        ));
  }

  void _VerifyPhoneNumber()async{

    // phone authentication using firebase
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted:(AuthCredential credentials)async{
          await FirebaseAuth.instance.signInWithCredential(credentials).then((value) async{
            //user created
            if(value.user!=null){

              print(value.user);
              print(value.user.phoneNumber);


              User firebaseUser = await FirebaseAuth.instance.currentUser;

              kGlobal_Access_Token = await LoginServices(
                firebaseUserId : firebaseUser.uid.toString(),
                appId: kGlobal_appId,
              ).getAccessToken();

              print(firebaseUser.uid.toString());
              if(kGlobal_Access_Token == null){
                // Registering New User
                print("No such User In API Server");
                Timer(Duration(seconds: 2),()=> setState(() {
                  load = false;
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => QRViewExample(contactNumber: widget.phoneNumber,)),
                  // );
                }));
              }
              else{
                // Login User
                print('User Logged In');
                // todo: uncomment it after testing
                setState(() {
                  load=true;
                });
                //DriverInfo = await GetDriverInfoByToken(accessToken: Global_Access_Token).GetDriverInfoByTokenFunction();
                Timer(
                    Duration(seconds: 2),
                        () => setState(() {
                      load = false;
                      // Navigator.of(context)
                      //     .pushAndRemoveUntil(
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             NavScreen()),
                      //         (Route<dynamic> route) =>
                      //     false);
                    }));
              }
            }
            else{
              Toast.show("Invalid Pin", context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);

              print("Error");
            }
          });
        },
        verificationFailed: (FirebaseAuthException authException) {
          print(authException.message);
        },

        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = verificationId;
          print(verificationId);
          print("Timeout");
        },
        codeSent: (String verificationID, [int resendToken]){
          setState(() {
            thePin=verificationID;
          });
        }
    );

  }
}
