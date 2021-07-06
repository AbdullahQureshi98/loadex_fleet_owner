// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// class ScanCnicScreen extends StatefulWidget {
//   final String phoneNumber;
//   ScanCnicScreen({this.phoneNumber});
//   @override
//   _ScanCnicScreenState createState() => _ScanCnicScreenState();
// }
//
// class _ScanCnicScreenState extends State<ScanCnicScreen> {
//   Barcode result;
//   var flashState = flashOn;
//   var cameraState = frontCamera;
//   QRViewController controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   // In order to get hot reload to work we need to pause the camera if the platform
//   // is android, or resume the camera if the platform is iOS.
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller.pauseCamera();
//     } else if (Platform.isIOS) {
//       controller.resumeCamera();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return load == true
//         ? Loading()
//         : Container(
//       // constraints: BoxConstraints.expand(),
//       // decoration: BoxDecoration(
//       //     image: DecorationImage(
//       //         image: AssetImage('assets/trucking.png'),
//       //         fit: BoxFit.cover)),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 10,
//               ),
//               Image.asset(
//                 "assets/images/LOADEX.png",
//                 height: 25,
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 12,
//               ),
//               Expanded(flex: 2, child: _buildQrView(context)),
//               Expanded(
//                 flex: 2,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                           InkWell(
//                               onTap: () {
//                                 if (controller != null) {
//                                   controller?.resumeCamera();
//                                   controller.flipCamera();
//                                   setState(() {
//                                     controller.flipCamera();
//                                   });
//                                 }
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Icon(
//                                   Icons.refresh,
//                                   size: 30,
//                                 ),
//                               )),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               Enter_Cnic[Language_Index],
//                               style: TextStyle(
//                                   fontFamily: 'Geomanist',
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black87),
//                             )
//                           ],
//                         ),
//                       ),
//                       if (result != null)
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Material(
//                             borderRadius:
//                             BorderRadius.all(Radius.circular(6)),
//                             child: SizedBox(
//                               width: 250,
//                               child: TextField(
//                                 // controller: TextEditingController()..text = placeHolderText,
//                                 controller: TextEditingController()
//                                   ..text = '$newresult',
//                                 keyboardType: TextInputType.number,
//                                 textAlign: TextAlign.center,
//                                 onChanged: (String value) {
//                                   setState(() {
//                                     print(result.code);
//                                     Cnic_Number = int.parse(value);
//                                   });
//                                 },
//                                 cursorColor: Color(0xff575BEA),
//                                 decoration: InputDecoration(
//                                     filled: true,
//                                     fillColor: Color(0xffF5F5F5),
//                                     hintStyle: TextStyle(),
//                                     border: InputBorder.none,
//                                     contentPadding: EdgeInsets.symmetric(
//                                         horizontal: 22, vertical: 13)),
//                               ),
//                             ),
//                           ),
//                         )
//                       else
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Material(
//                             borderRadius:
//                             BorderRadius.all(Radius.circular(6)),
//                             child: SizedBox(
//                               width: 250,
//                               child: TextFormField(
//                                 keyboardType: TextInputType.number,
//                                 // controller: TextEditingController()..text = placeHolderText,
//                                 textAlign: TextAlign.center,
//                                 onChanged: (String value) {
//                                   setState(() {
//                                     Cnic_Number = int.parse(value);
//                                     if (value == '') {
//                                       setState(() {
//                                         Cnic_Number = null;
//                                       });
//                                     }
//                                   });
//                                 },
//                                 cursorColor: Color(0xff575BEA),
//                                 decoration: InputDecoration(
//                                     filled: true,
//                                     fillColor: Color(0xffF5F5F5),
//                                     hintText:
//                                     '${Cnic_number[Language_Index]}',
//                                     hintStyle: TextStyle(),
//                                     border: InputBorder.none,
//                                     contentPadding: EdgeInsets.symmetric(
//                                         horizontal: 22, vertical: 13)),
//                               ),
//                             ),
//                           ),
//                         ),
//                       SizedBox(
//                         height: 70,
//                         width: 70,
//                         child: InkWell(
//                           onTap: () {
//                             if (Cnic_Number == null) {
//                               return 'Invalid Cninc';
//                             } else if (Cnic_Number !=
//                                 null && Cnic_Number.toString().length == 13) {
//                               print('i am here');
//                               //setting user's cnic in the firebase Driver's logged in user.
//                               //  Firestore.instance
//                               //      .collection('Drivers')
//                               //      .document(preferences
//                               //          .getString('id'))
//                               //      .updateData({
//                               //    'cnic': Cnic_Number
//                               //        .toString(),
//                               //  });
//                               //
//                               //  Firestore.instance
//                               //      .collection('MessagesLength')
//                               //      .document(preferences
//                               //      .getString('id'))
//                               //      .setData({
//                               //    'messagesLength': 0
//                               //  });
//
//                               // creating first and empty message to manager
//
//                               setState(() {
//                                 load = true;
//                               });
//                               Timer(
//                                   Duration(seconds: 2),
//                                       () => setState(() {
//                                     load = false;
//                                     Navigator
//                                         .pushReplacement(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder:
//                                               (context) =>
//                                               SelectCategory(contactNumber: widget.contactNumber, cnicNumber: Cnic_Number,)),
//                                     );
//                                   }));
//                             }
//                           },
//                           child: Card(
//                               elevation: 3,
//                               shadowColor: Color(0xff4C76CC),
//                               color: Cnic_Number==null?Colors.black12:Color(0xff4C76CC),
//                               child: Center(
//                                   child: FaIcon(
//                                     Language_Index==0?FontAwesomeIcons.arrowRight:FontAwesomeIcons.arrowLeft,
//                                     color: Colors.white,
//                                   ))),
//                         ),
//                       ),
//                       // Padding(
//                       //   padding: const EdgeInsets.only(top: 15.0),
//                       //   child: Row(
//                       //     mainAxisAlignment: MainAxisAlignment.center,
//                       //     crossAxisAlignment: CrossAxisAlignment.center,
//                       //     children: <Widget>[
//                       //       Padding(
//                       //         padding: const EdgeInsets.only(bottom: 10.0),
//                       //         child: Row(
//                       //           mainAxisAlignment: MainAxisAlignment.center,
//                       //           children: [
//                       //             Cnic_Number == null
//                       //                 ? CustomElevationDeactivated(
//                       //                     child: FlatButton(
//                       //                       shape: RoundedRectangleBorder(
//                       //                         borderRadius:
//                       //                             BorderRadius.circular(
//                       //                                 8.0),
//                       //                         // side: BorderSide(color: Colors.red)
//                       //                       ),
//                       //                       height: 50,
//                       //                       minWidth: 50,
//                       //                       color: Cnic_Number == null
//                       //                           ? Colors.black12
//                       //                           : Color(0xff575BEA),
//                       //                       child: Icon(
//                       //                         Language_Index == 0
//                       //                             ? Icons
//                       //                                 .arrow_forward_rounded
//                       //                             : Icons
//                       //                                 .arrow_back_rounded,
//                       //                         color: Colors.white,
//                       //                       ),
//                       //                       onPressed: () {
//                       //                         if (Cnic_Number == null) {
//                       //                           return 'Invlaid Cnic';
//                       //                         } else if (Cnic_Number !=
//                       //                             null && Cnic_Number.toString().length == 13) {
//                       //                           Navigator.pushReplacement(
//                       //                             context,
//                       //                             MaterialPageRoute(
//                       //                                 builder: (context) =>
//                       //                                     SelectCategory(contactNumber: widget.contactNumber, cnicNumber: Cnic_Number,)),
//                       //                           );
//                       //                         }
//                       //                       },
//                       //                     ),
//                       //                   )
//                       //                 : CustomElevation(
//                       //                     child: FlatButton(
//                       //                       shape: RoundedRectangleBorder(
//                       //                         borderRadius:
//                       //                             BorderRadius.circular(
//                       //                                 8.0),
//                       //                         // side: BorderSide(color: Colors.red)
//                       //                       ),
//                       //                       height: 50,
//                       //                       minWidth: 50,
//                       //                       color: Cnic_Number == null
//                       //                           ? Colors.black12
//                       //                           : Color(0xff575BEA),
//                       //                       child: Icon(
//                       //                         Language_Index == 0
//                       //                             ? Icons
//                       //                                 .arrow_forward_rounded
//                       //                             : Icons
//                       //                                 .arrow_back_rounded,
//                       //                         color: Colors.white,
//                       //                       ),
//                       //                       onPressed: () {
//                       //                         if (Cnic_Number == null) {
//                       //                             return 'Invalid Cninc';
//                       //                         } else if (Cnic_Number !=
//                       //                             null && Cnic_Number.toString().length == 13) {
//                       //                           print('i am here');
//                       //                          //setting user's cnic in the firebase Driver's logged in user.
//                       //                          //  Firestore.instance
//                       //                          //      .collection('Drivers')
//                       //                          //      .document(preferences
//                       //                          //          .getString('id'))
//                       //                          //      .updateData({
//                       //                          //    'cnic': Cnic_Number
//                       //                          //        .toString(),
//                       //                          //  });
//                       //                          //
//                       //                          //  Firestore.instance
//                       //                          //      .collection('MessagesLength')
//                       //                          //      .document(preferences
//                       //                          //      .getString('id'))
//                       //                          //      .setData({
//                       //                          //    'messagesLength': 0
//                       //                          //  });
//                       //
//                       //                           // creating first and empty message to manager
//                       //
//                       //                           setState(() {
//                       //                             load = true;
//                       //                           });
//                       //                           Timer(
//                       //                               Duration(seconds: 2),
//                       //                               () => setState(() {
//                       //                                     load = false;
//                       //                                     Navigator
//                       //                                         .pushReplacement(
//                       //                                       context,
//                       //                                       MaterialPageRoute(
//                       //                                           builder:
//                       //                                               (context) =>
//                       //                                                   SelectCategory(contactNumber: widget.contactNumber, cnicNumber: Cnic_Number,)),
//                       //                                     );
//                       //                                   }));
//                       //                         }
//                       //                       },
//                       //                     ),
//                       //                   )
//                       //           ],
//                       //         ),
//                       //       ),
//                       //     ],
//                       //   ),
//                       // ),
//                       // SizedBox(
//                       //   height: 130,
//                       // )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   bool _isFlashOn(String current) {
//     return flashOn == current;
//   }
//
//   bool _isBackCamera(String current) {
//     return backCamera == current;
//   }
//
//   Widget _buildQrView(BuildContext context) {
//     // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
//     var scanArea = (MediaQuery.of(context).size.width < 400 ||
//         MediaQuery.of(context).size.height < 400)
//         ? 100.0
//         : 200.0;
//     // To ensure the Scanner view is properly sizes after rotation
//     // we need to listen for Flutter SizeChanged notification and update controller
//     return NotificationListener<SizeChangedLayoutNotification>(
//         onNotification: (notification) {
//           Future.microtask(
//                   () => controller?.updateDimensions(qrKey, scanArea: scanArea));
//           return false;
//         },
//         child: SizeChangedLayoutNotifier(
//             key: const Key('qr-size-notifier'),
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//               overlay: QrScannerOverlayShape(
//                 borderColor: Color(0xff575BEA),
//                 borderRadius: 5,
//                 borderLength: 20,
//                 borderWidth: 10,
//                 cutOutSize: scanArea,
//               ),
//             )));
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = null;
//         newresult = null;
//         result = scanData;
//         String string = result.code.toString();
//         controller?.pauseCamera();
//         newresult = string.substring(string.length - 14);
//         newresult = newresult.substring(0, newresult.length - 1);
//         Cnic_Number = newresult;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }
