import 'package:abcd/filterchip.dart';
import 'package:abcd/shapes.dart';
import 'package:flutter/material.dart';



void main(){
  runApp(
    MaterialApp(
      title:"newone",
      home: FilterChipDisplay(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),

    )
  );

}

class myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("new App"),
        
      ),
      body: Center(
        child:Image(image: AssetImage("assets/new.jpg"),) 
        //Image.asset("ba.jpg"),
        
      ),
    );
  
      
    
  }
}
