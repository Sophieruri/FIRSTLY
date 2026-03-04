import 'package:flutter/material.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        //
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/download.jpg"),
            Text("login screen"),
            Text("Enter username"),
            TextField(),
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

