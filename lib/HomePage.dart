import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //ToDo import Images
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage lucky = AssetImage("images/rupee.png");
  AssetImage unlucky = AssetImage("images/sadFace.png");

  //TODO get an array
  late List<String> itemArray;
  late int luckyNumber ;
  @override
  void initState(){
    super.initState();
    itemArray= List<String>.generate(25, (index) => "empty");
    generateRandomNumber();
  }

  generateRandomNumber(){
    int random = Random().nextInt(25);

    setState(() {
      luckyNumber=random;
    });
  }

  //TODO init array with 25 element

  //TODO define a getImage meth
  AssetImage getImage(int index){
    String currentState = itemArray[index];
    switch(currentState){
      case "lucky":
        return lucky;
      break;
      case "unlucky":
        return unlucky;
        break;
    }
    return circle;
  }
  //TODO play game method
  playGame(int index){
   if(luckyNumber==index){
     setState(() {
       itemArray[index]= "lucky";
     });
   }
   else{
     setState(() {
       itemArray[index]= "unlucky";
     });
   }
  }

  //TODO showall
  showAll(){
    setState(() {
      itemArray=List<String>.filled(25, "unlucky");
    });
    itemArray[luckyNumber]="lucky";
  }

  //TODO RESET aLL
  resetGame(){
    setState(() {
      itemArray=List<String>.filled(25, "empty");
    });
    generateRandomNumber();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scratch and win"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: GridView.builder(padding: EdgeInsets.all(20.0)
              ,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: itemArray.length,
              itemBuilder: (context,i)=>SizedBox(
               width: 50.0,
                height: 50.0,
                child: MaterialButton(
                  onPressed: (){
                    this.playGame(i);
                  },
                  child: Image(
                    image: this.getImage(i),
                  ),
                ),
              ))
          ),

          Container(
            child: MaterialButton(
              onPressed: (){
                this.showAll();
                },
              child: Text("show all"),
              color: Colors.green,
            ),
          ),
          Container(
            child: MaterialButton(
              onPressed: (){
                this.resetGame();
              },
              child: Text("Reset Game"),
              color: Colors.green,
            ),
          ),

        ],
      ),
    );
  }
}
