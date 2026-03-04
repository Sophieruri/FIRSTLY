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
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/download.jpg"),
            Text("login screen"),
            Text("Enter username"),
            TextField(
              decoration: ,
            ),
            Text("Enter password"),
            TextField(),
            SizedBox(height: 30),
            MaterialButton(
              onPressed: () {},
              child: Text(
                "login",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              color: Colors.deepPurpleAccent,
            ),
          ],
        ),
      ),
    ),
  );
}

