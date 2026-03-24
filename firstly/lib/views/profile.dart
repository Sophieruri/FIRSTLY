// 
import 'package:flutter/material.dart';
//import 'package:icons_plus/icons_plus.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Profile", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          
          Positioned.fill(
            child: Image.asset("assets/image.png", fit: BoxFit.cover),
          ),

          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                "assets/netflix.webp",
                              ), 
                            ),
                            SizedBox(height: 15),

                           
                            Text(
                              "Sophie Jerurbai",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "sophie@email.com",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 30),

                            
                            _profileField("Full Name", "Sophie Jerurbai"),
                            _profileField("Email", "sophie@email.com"),
                            _profileField("Phone", "+254 712 345 678"),
                            _profileField(
                              "Password",
                              "********",
                              obscure: true,
                            ),

                            SizedBox(height: 30),

                            Container(
                              width: double.infinity,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 2, 39, 39),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Save Changes",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            SizedBox(height: 20),

                            
                            Container(
                              width: double.infinity,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 2, 39, 39),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _profileField(String label, String value, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        initialValue: value,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
