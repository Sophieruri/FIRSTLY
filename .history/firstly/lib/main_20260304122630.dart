import 'package:flutter/material.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
       // appBar: AppBar(
         // backgroundColor: Colors.deepPurpleAccent,
         // title: Text(
           // "Login Screen",
            //style: TextStyle(
             // color: Colors.white38,
             // fontSize: 40,
              //fontStyle: FontStyle.normal,
           // ),
          //),
          centerTitle:true,
        ),

          body:Padding(
           padding: const 
           EdgeInsets.all(8.0),
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/download.jpg"),
              Text("login screen"),
              Text("Enter username"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)
                    
                  ),hintText: "use email OR PHONE NUMBER",
                  
                  prefixIcon: Icon(Icons.person)
                  
                ),
              ),
              Text("Enter password"),
              TextField(),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Enter password",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                ],
              ),
              SizedBox(height: 20,),
              // MaterialButton(
              //   onPressed: () {},
              //   child: Text(
              //     "login",
              //     style: TextStyle(color: Colors.white, fontSize: 20),
              //   ),
              //   color: Colors.deepPurpleAccent,
              //),
              Container(

                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.amber),
                 child: Text("login",
                 style: TextStyle(color: Colors.white,fontSize: 16),),),
          Row(children: [
            
          ],)

            ],
           
          ),
          
        ),
      ),
    ),
  );
}

