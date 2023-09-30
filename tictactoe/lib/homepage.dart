
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool ohturn = true; //first player is O!
  List<String> displayExOh = ['','','','','','','','',''];

  var myTStyle = TextStyle( color: Colors.white , fontSize: 27);
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;

  static var myNewFontWhite = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.white,letterSpacing: 3,fontSize: 15)
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Player O", style: myNewFontWhite),
                        SizedBox(
                          height: 20
                        ),
                        Text(ohScore.toString() , style: myNewFontWhite),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Player X", style: myNewFontWhite),
                        SizedBox(
                          height: 20
                        ),
                        Text(exScore.toString() , style: myNewFontWhite),
                      ],
                    ),
                  ),
                ],
              )
              ),
            ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, 
                  ), 
                itemBuilder: (BuildContext context,int index){
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      
                          child: Center(
                            child: Text(
                              displayExOh[index],
                              
                              style: TextStyle(color: Colors.white, fontSize: 50,),
                              ),
                          ),
                  
                    ),
                  );
                }
                ),
            ),
          ),
          // Expanded(
          //   child: Container(
          //     child: Center(
          //       child: Text("TIC TAC TOE", style: myNewFontWhite,)
          //       ),
          //     ),
          //   ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 30,
            child: Text("TIC TAC TOE", style: myNewFontWhite),
          ),
          
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
            child: Text("@createdbykrish", style: myNewFontWhite),
          )
        
        ],
      ),
    );
  }


  void _tapped(int index) {

    setState(() {
      if( displayExOh[index]==''){
        if(ohturn){
          displayExOh[index] = 'o' ;
          filledBoxes+= 1;
        }else{
          displayExOh[index] = 'x' ;
          filledBoxes+= 1;
        }

        ohturn = !ohturn;
        _checkwinner();
      }
    });

  }


  void _checkwinner(){
    //check 1st row
    if(displayExOh[0] == displayExOh[1]&&
       displayExOh[0] == displayExOh[2]&&
       displayExOh[0] != '') {
        _showWinDialogue(displayExOh[0]);
       }
    
    //check 2nd row
    if(displayExOh[3] == displayExOh[4]&&
       displayExOh[3] == displayExOh[5]&&
       displayExOh[3] != '') {
        _showWinDialogue(displayExOh[3]);
       }

    //check 3rd row
    if(displayExOh[6] == displayExOh[7]&&
       displayExOh[6] == displayExOh[8]&&
       displayExOh[6] != '') {
        _showWinDialogue(displayExOh[6]);
       }

    //check 1st col
    if(displayExOh[0] == displayExOh[3]&&
       displayExOh[0] == displayExOh[6]&&
       displayExOh[0] != '') {
        _showWinDialogue(displayExOh[0]);
       }

    //check 2nd col
    if(displayExOh[1] == displayExOh[4]&&
       displayExOh[1] == displayExOh[7]&&
       displayExOh[1] != '') {
        _showWinDialogue(displayExOh[1]);
       }

    //check 3rd col
    if(displayExOh[2] == displayExOh[5]&&
       displayExOh[2] == displayExOh[8]&&
       displayExOh[2] != '') {
        _showWinDialogue(displayExOh[2]);
       }

    //check 1st diagonal
    if(displayExOh[0] == displayExOh[4]&&
       displayExOh[0] == displayExOh[8]&&
       displayExOh[0] != '') {
        _showWinDialogue(displayExOh[0]);
       }

    //check 2nd diagonal
    if(displayExOh[2] == displayExOh[4]&&
       displayExOh[2] == displayExOh[6]&&
       displayExOh[2] != '') {
        _showWinDialogue(displayExOh[2]);
       }

    else if(filledBoxes== 9){
      _showDrawDialogue();
    }

  }


   void _showDrawDialogue() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          //backgroundColor: Colors.grey,
          title: Text("Match DRAW!"),
          actions: [
            FilledButton(
              child: Text("Play Again!"),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();

              },
              ),
          ],
        );
    });
  }


  void _showWinDialogue(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          //backgroundColor: Colors.grey,
          title: Text(winner + " is WINNER!!!"),
          actions: [
            FilledButton(
              child: Text("Play Again!"),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();

              },
              ),
          ],
        );
    });

    filledBoxes= 0;

    if(winner == 'o'){
      ohScore+=1;
    }
    else if(winner == 'x'){
      exScore+=1;
    }

  }

  void _clearBoard(){
    setState(() {
        for(int i=0; i<9; i++){
        displayExOh[i]='';
      }
    });

    filledBoxes= 0;

  }

}