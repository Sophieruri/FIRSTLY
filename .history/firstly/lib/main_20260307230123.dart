import 'package:flutter/material.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
       // appBar: AppBar(
         // backgroundColor: Colors.deepOrangeAccent,
         // title: Text(
           // "Login Screen",
            //style: TextStyle(
             // color: Colors.white,
             // fontSize: 40,
              //fontStyle: FontStyle.normal,
              //centerTitle: true,
           // ),
          
          
      
        

          body:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAllignment:MainAxisAlignment.center,
              children: [

                //Text( Text(
              //   "Jumia Marketplace",
              //   style: TextStyle(
              //     color: Colors.blue,
              //     fontSize: 30,
              //     fontWeight: FontWeight.w800,
              //   ),
//),
             // ),
             padding: const 
             EdgeInsets.all(8.0),
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/download.jpg"),
                padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 20, 5),
                  child:row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Enter Username",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
                  ),
                   ),
                    ],
                     ),
                      ),
          
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: TextField(
                          decoration: InputDecoration(
                            hint: Text("Email or phone number"),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                            
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ),
                        SizedBox(height: 20,),
                        Padding(
                