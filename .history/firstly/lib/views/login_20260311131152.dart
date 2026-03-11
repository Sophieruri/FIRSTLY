import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              mainAxisAlignment: MainAxisAlignment.center,
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
             
                Image.asset("assets/download.jpg"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 20, 5),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      Text("Enter Username",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,
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
                        Padding(padding: const EdgeInsets.fromLTRB(25, 0, 20, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Password",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  decoration: InputDecoration(
                    hint: Text("confirm Password"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // MaterialButton(
              //   onPressed: () {},
              //   child: Text("signup", style: TextStyle(color: Colors.white)),
              //   color: Colors.deepOrangeAccent,

              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "login",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                onTap:
              ),
            ],
          ),
        ),
      );
  }
}