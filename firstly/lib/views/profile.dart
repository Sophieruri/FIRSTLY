import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController(
    text: "Sophie Jerurbai",
  );
  final TextEditingController _emailController = TextEditingController(
    text: "sophie@email.com",
  );
  final TextEditingController _phoneController = TextEditingController(
    text: "+254 712 345 678",
  );
  final TextEditingController _passwordController = TextEditingController(
    text: "",
  );

  bool _isEditing = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0077B6), Color(0xFF00B4D8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Profile",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _isEditing = !_isEditing),
                        child: Icon(
                          _isEditing ? Icons.close : Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

               
                const SizedBox(height: 10),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      child: const Icon(
                        Icons.person_rounded,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                    if (_isEditing)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: const Icon(
                            Icons.camera_alt,
                            size: 16,
                            color: Color(0xFF0077B6),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 10),

                Text(
                  _nameController.text,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  _emailController.text,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 16),

                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _statBox("0", "Trips"),
                    _statBox("0", "Reviews"),
                    _statBox("0", "Saved"),
                  ],
                ),

                const SizedBox(height: 20),

               
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                      child: Column(
                        children: [
                         
                          _profileField(
                            label: "Full Name",
                            controller: _nameController,
                            icon: Icons.person_outline,
                            enabled: _isEditing,
                          ),
                          _profileField(
                            label: "Email",
                            controller: _emailController,
                            icon: Icons.email_outlined,
                            enabled: _isEditing,
                            type: TextInputType.emailAddress,
                          ),
                          _profileField(
                            label: "Phone",
                            controller: _phoneController,
                            icon: Icons.phone_outlined,
                            enabled: _isEditing,
                            type: TextInputType.phone,
                          ),
                          _profileField(
                            label: "New Password",
                            controller: _passwordController,
                            icon: Icons.lock_outline,
                            enabled: _isEditing,
                            obscure: true,
                          ),

                          const SizedBox(height: 10),

                        
                          if (_isEditing)
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0077B6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() => _isEditing = false);
                                  Get.snackbar(
                                    "Success",
                                    "Profile updated!",
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                  );
                                },
                                child: Text(
                                  "Save Changes",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),

                          const SizedBox(height: 15),

                         
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0077B6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: () {
                                Get.dialog(
                                  AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    title: Text(
                                      "Logout",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF023232),
                                      ),
                                    ),
                                    content: Text(
                                      "Are you sure you want to logout?",
                                      style: GoogleFonts.poppins(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Get.back(),
                                        child: Text(
                                          "Cancel",
                                          style: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Get.offAllNamed('/');
                                        },
                                        child: Text(
                                          "Logout",
                                          style: GoogleFonts.poppins(
                                            color: const Color(0xFF0077B6),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Text(
                                "Logout",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
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
        ],
      ),
    );
  }

  Widget _statBox(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(color: Colors.white70, fontSize: 13),
        ),
      ],
    );
  }

  Widget _profileField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool obscure = false,
    bool enabled = false,
    TextInputType type = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        enabled: enabled,
        keyboardType: type,
        style: GoogleFonts.poppins(fontSize: 14),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.poppins(
            color: const Color(0xFF0077B6),
            fontSize: 13,
          ),
          prefixIcon: Icon(icon, color: const Color(0xFF0077B6)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF0077B6)),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
          filled: true,
          fillColor: enabled ? Colors.white : Colors.grey.shade50,
        ),
      ),
    );
  }
}
