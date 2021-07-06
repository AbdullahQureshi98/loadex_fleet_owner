import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:loadex_fleet_owner/globals/global_loader.dart';
import 'package:loadex_fleet_owner/globals/variables.dart';
import 'package:toast/toast.dart';

class PhoneNumberScreen extends StatefulWidget {
  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  PhoneNumber Phone_Number;
  @override
  Widget build(BuildContext context) {
    return vloading==true?GlobalLoader():Container(
      // constraints: BoxConstraints.expand(),
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage('assets/trucking.png'), fit: BoxFit.cover)),
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
                        'Enter Phone Number',
                        style: TextStyle(
                            fontFamily: 'Geomanist',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3A3A3A)),
                      )
                    ],
                  ), SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: IntlPhoneField(
                            showDropdownIcon: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffEEEEEE),
                              focusColor: Color(0xffEEEEEE),
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            initialCountryCode: 'PK',
                            onChanged: (phone) {
                              setState(() {
                                Phone_Number=phone;
                              });

                              print("Entered Phone Number : " + phone.completeNumber);
                              // print(phone.countryCode);

                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                    )
                  ]),
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: InkWell(
                      onTap: () {
                        if(Phone_Number==null || Phone_Number.completeNumber.length<13){
                          Toast.show("Enter Complete Phone Number", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP,backgroundColor: Colors.black,textColor: Colors.white,);

                        }
                        else if(Phone_Number!=null && Phone_Number.completeNumber.length==13) {
                          setState(() {
                            vloading = true;
                          });

                          Timer(Duration(seconds: 2),()=> setState(() {
                            vloading = false;
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => PinScreen(phoneNumber: Phone_Number.completeNumber.toString(),)),
                            // );
                          }));

                        }
                        else if(Phone_Number.completeNumber.length>13){
                          Toast.show("Enter a number of Valid length", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP,backgroundColor: Colors.black,textColor: Colors.white,);

                        }
                      },
                      child: Card(
                          elevation: 3,
                          shadowColor: Color(0xff4C76CC),
                          color: Phone_Number==null?Colors.black12:Color(0xff4C76CC),
                          child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.arrowRight,
                                color: Colors.white,
                              ))),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 10.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Phone_Number==null?CustomElevationDeactivated(child:FlatButton(
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(8.0),
                  //           // side: BorderSide(color: Colors.red)
                  //         ),
                  //         height: 50,
                  //         minWidth: 50,
                  //         color: Phone_Number==null?Colors.black12:Color(0xff575BEA),
                  //         child: Icon(
                  //           Language_Index==0?Icons.arrow_forward_rounded:Icons.arrow_back_rounded,
                  //           color: Colors.white,
                  //         ),
                  //         onPressed: () {
                  //           if(Phone_Number==null){}
                  //           else if(Phone_Number!=null){
                  //             Navigator.pushReplacement(
                  //               context,
                  //               MaterialPageRoute(builder: (context) => PinScreen(phoneNumber: Phone_Number.countryCode.toString())),
                  //             );}
                  //         },
                  //       ), ):
                  //       CustomElevation(
                  //         child: FlatButton(
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(8.0),
                  //             // side: BorderSide(color: Colors.red)
                  //           ),
                  //           height: 50,
                  //           minWidth: 50,
                  //           color: Phone_Number==null?Colors.black12:Color(0xff575BEA),
                  //           child: Icon(
                  //             Language_Index==0?Icons.arrow_forward_rounded:Icons.arrow_back_rounded,
                  //             color: Colors.white,
                  //           ),
                  //           onPressed: () {
                  //             if(Phone_Number==null || Phone_Number.completeNumber.length<13){
                  //               Toast.show("Enter Complete Phone Number", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP,backgroundColor: Colors.black,textColor: Colors.white,);
                  //
                  //             }
                  //             else if(Phone_Number!=null && Phone_Number.completeNumber.length==13) {
                  //               setState(() {
                  //                 load = true;
                  //               });
                  //
                  //               Timer(Duration(seconds: 2),()=> setState(() {
                  //                 load = false;
                  //                 Navigator.pushReplacement(
                  //                   context,
                  //                   MaterialPageRoute(
                  //                       builder: (context) => PinScreen(phoneNumber: Phone_Number.completeNumber.toString(),)),
                  //                 );
                  //               }));
                  //
                  //             }
                  //             else if(Phone_Number.completeNumber.length>13){
                  //               Toast.show("Enter a number of Valid length", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP,backgroundColor: Colors.black,textColor: Colors.white,);
                  //
                  //             }
                  //             },
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ]),
          ),
        ));
  }
}
