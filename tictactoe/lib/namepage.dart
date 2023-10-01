import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {

  final TextEditingController _name1=TextEditingController();
  final TextEditingController _name2=TextEditingController();
  

  static var myNewFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.black,letterSpacing: 3,fontSize: 25)
  );

  static var myNewFontWhite = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.white,letterSpacing: 3,fontSize: 15)
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[900],
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                
                SizedBox(
                  child: Text("Player 1:", style: myNewFontWhite,) 
                ),
                TextFormField(
                  controller: _name1,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person,color: Colors.white),
                  labelStyle: TextStyle(color: Colors.grey[700]),
                    hintText: "Enter Player 1 name",
                    labelText: "Enter name",
                  ),
                
                  onChanged: (value) => {
                    
                    },
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  child: Text("Player 2:", style: myNewFontWhite,) 
                ),
                TextFormField(
                  controller: _name2,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person,color: Colors.white),
                  labelStyle: TextStyle(color: Colors.grey[700]),
                  
                  hintText: "Enter Player 2 name",
                  labelText: "Enter name",
                  ),
                  onChanged: (value) => {
                    
                    },
                ),
                SizedBox(
                  height: 200,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  
                  onPressed:() {
                    Navigator.push(context,
                    MaterialPageRoute(
                      builder: ((context) => HomePage(
                         _name1.text,
                        _name2.text,
                      ) ),
                      )
                    );
                  },
                  
                  child: Text("Join in!", style: myNewFont)
                  ),
                SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
