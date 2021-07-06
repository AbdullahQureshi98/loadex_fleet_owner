import 'package:flutter/material.dart';
import 'package:loadex_fleet_owner/globals/global_loader.dart';
import 'dart:async';
class SelectLanguageScreen extends StatefulWidget {
  @override
  _SelectLanguageScreenState createState() => _SelectLanguageScreenState();
}
bool initialLoader = true;
class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  bool _urdu = false;
  bool _english = true;
  bool _pashto = false;
  // bool _sindhi = false;
  bool _hazarawal = false;
  bool _saraiki = false;
  bool _hindko = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getIcon1();
  }

  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds:3),()=> {
      if(mounted){
        setState(() {
          initialLoader=false;
        })}}
    );
    return
      initialLoader==true?GlobalLoader():Container(
        //     constraints: BoxConstraints.expand(),
        // decoration: BoxDecoration(
        // image: DecorationImage(
        // image:  AssetImage('assets/trucking.png'),
        // fit: BoxFit.cover
        //  )
        // ),
          child:
          Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Image.asset(
                  "assets/images/LOADEX.png",
                  height: 25,
                  width: MediaQuery.of(context).size.width-50,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Select Your Language',
                      style: TextStyle(
                          fontFamily: 'Geomanist',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3A3A3A)),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'اپنی زبان منتخب کریں   ',
                        style: TextStyle(
                            fontFamily: 'Geomanist',
                            fontSize: 25,
                            color: Color(0xFF3A3A3A)),
                      )
                    ],
                  ),
                ),
                // Row(
                //   children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                //   ],
                // ),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // english
                          Padding(
                            padding: const EdgeInsets.only(bottom:8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    // side: BorderSide(color: Colors.red)
                                  ),
                                  height: 70,
                                  minWidth: 230,
                                  color: Color(0xff4C76CC),
                                  child: Text(
                                    "English",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  onPressed: () {
                                    //Language_Index=0;
                                    // Navigator.pushReplacement(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => QRViewExample()),
                                    // );
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => PhoneScreen()),
                                    // );
                                  },
                                )
                              ],
                            ),
                          ),
                          // urdu
                          Padding(
                            padding: const EdgeInsets.only(bottom:10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    // side: BorderSide(color: Colors.red)
                                  ),
                                  height: 70,
                                  minWidth: 230,
                                  color:// _urdu != true ? Color(0xffC4C4C4) :
                                  Color(0xffC4C4C4),
                                  child: Text(
                                    "اردو",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  onPressed: () {
                                    if(_urdu == true){
                                      // Language_Index=1;
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) => PhoneScreen()),);
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                          // Pashto
                          Padding(
                            padding: const EdgeInsets.only(bottom:10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    // side: BorderSide(color: Colors.red)
                                  ),
                                  height: 70,
                                  minWidth: 230,
                                  color: Color(0xffC4C4C4),
                                  child: Text(
                                    "پشتو",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  onPressed: () {
                                    if(_pashto == true){
                                      // Language_Index=3;
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) => PhoneScreen()),
                                      // );
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                          // Hazarawaal
                          Padding(
                            padding: const EdgeInsets.only(bottom:10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    // side: BorderSide(color: Colors.red)
                                  ),
                                  height: 70,
                                  minWidth: 230,
                                  color: Color(0xffC4C4C4),
                                  child: Text(
                                    "Hazarawal",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  onPressed: () {
                                    if(_hazarawal == true){
                                      // Language_Index=2;
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) => PhoneScreen()),
                                      // );
                                    }},
                                )
                              ],
                            ),
                          ),
                          // Saraiki
                          Padding(
                            padding: const EdgeInsets.only(bottom:10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    // side: BorderSide(color: Colors.red)
                                  ),
                                  height: 70,
                                  minWidth: 230,
                                  color:// _urdu != true ? Color(0xffC4C4C4) :
                                  Color(0xffC4C4C4),
                                  child: Text(
                                    "سرائیکی",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  onPressed: () {
                                    if(_saraiki == true){
                                      // Language_Index=1;
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) => PhoneScreen()),);
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                          // Hindko
                          Padding(
                            padding: const EdgeInsets.only(bottom:10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    // side: BorderSide(color: Colors.red)
                                  ),
                                  height: 70,
                                  minWidth: 230,
                                  color:// _urdu != true ? Color(0xffC4C4C4) :
                                  Color(0xffC4C4C4),
                                  child: Text(
                                    "ہندکو",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  onPressed: () {
                                    if(_hindko == true){
                                      //Language_Index=1;
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) => PhoneScreen()),);
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                          // // barahui
                          // Padding(
                          //   padding: const EdgeInsets.only(bottom:10.0),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       FlatButton(
                          //         shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(8.0),
                          //           // side: BorderSide(color: Colors.red)
                          //         ),
                          //         height: 70,
                          //         minWidth: 230,
                          //         color:// _urdu != true ? Color(0xffC4C4C4) :
                          //         Color(0xffC4C4C4),
                          //         child: Text(
                          //           "براہوئی",
                          //           style: TextStyle(
                          //               fontSize: 25,
                          //               fontWeight: FontWeight.bold,
                          //               color: Colors.white),
                          //         ),
                          //         onPressed: () {
                          //           if(_urdu == true){
                          //             Language_Index=1;
                          //             Navigator.push(
                          //               context,
                          //               MaterialPageRoute(builder: (context) => PhoneScreen()),);
                          //           }
                          //         },
                          //       )
                          //     ],
                          //   ),
                          // ),

                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: Image.asset("assets/images/truck.png"),
                // )
                // Row(
                //   children: [Image(image: AssetImage('assets/trucking.png'),height: 159,)],
                // )
              ],
            ),
          ));
  }
}
