

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'namepage.dart';




void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  static var myNewFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.black,letterSpacing: 3,fontSize: 25)
  );
  static var myNewFontWhite = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.white,letterSpacing: 3,fontSize: 25)
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
        
          Expanded(
            child: Container(
              child: Center(
                child: Text("TIC TAC TOE", style: myNewFontWhite)
                ),
            )
          ),

          Expanded(
            child: Container(
              child: CircleAvatar(
                radius: 150,
                backgroundColor: Colors.grey[900],
                child: Image.asset(
                  'lib/images/tictaktoelogo.png',
                  color: Colors.white,
                  fit: BoxFit.scaleDown,
                  ),
                ),

              )
            ),
            
            SizedBox(
              height: 200,
            ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.white),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: ((context) => NamePage()
                  )
                ),
              );
            }, 
            child: Text("Play Game!", style: myNewFont),

            ),
          SizedBox(
              height: 60,
            ),

        ],
      ),
    );
  }
}

