import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GlobalLoader extends StatefulWidget {
  @override
  _GlobalLoaderState createState() => _GlobalLoaderState();
}

class _GlobalLoaderState extends State<GlobalLoader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image(
            //   image: AssetImage('assets/loadex.PNG'),
            //   height: 30,
            // ),
            //SizedBox(height: 20,),
            SpinKitFadingFour(
              color: Color(0xff575BEA),
              size: 50.0,
            ),
          ],
        )
    );
  }
}

// class Loading extends StatefulWidget {
//   @override
//   _LoadingState createState() => _LoadingState();
// }
//
// class _LoadingState extends State<Loading> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//           child: SpinKitFadingFour(
//             color: Color(0xff575BEA),
//             size: 50.0,
//
//           ),
//         )
//     );
//   }
// }

// Widget initial_Loader(){
//   return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image(
//             image: AssetImage('assets/loadex.PNG'),
//             height: 30,
//           ),
//           SizedBox(height: 20,),
//           SpinKitFadingFour(
//             color: Color(0xff575BEA),
//             size: 50.0,
//
//           ),
//         ],
//       )
//   );
// }
