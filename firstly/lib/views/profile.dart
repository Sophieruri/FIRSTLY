import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          // Edit toggle button
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                setState(() => _isEditing = !_isEditing);
              },
              child: Icon(
                _isEditing ? Icons.close : Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background image
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
                      decoration: const BoxDecoration(
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
                            // ── Avatar ──────────────────────────
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage(
                                    "assets/download.jpg",
                                  ),
                                ),
                                if (_isEditing)
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      radius: 16,
                                      backgroundColor: Colors.blue,
                                      child: const Icon(
                                        Icons.camera_alt,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 15),

                            // ── Name & Email display ─────────────
                            Text(
                              _nameController.text,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _emailController.text,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 10),

                            // ── Stats Row ───────────────────────
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _statBox("0", "Trips"),
                                _statBox("0", "Reviews"),
                                _statBox("0", "Saved"),
                              ],
                            ),

                            const Divider(height: 30),

                            // ── Profile Fields ───────────────────
                            _profileField(
                              label: "Full Name",
                              controller: _nameController,
                              icon: Icons.person,
                              enabled: _isEditing,
                            ),
                            _profileField(
                              label: "Email",
                              controller: _emailController,
                              icon: Icons.email,
                              enabled: _isEditing,
                              type: TextInputType.emailAddress,
                            ),
                            _profileField(
                              label: "Phone",
                              controller: _phoneController,
                              icon: Icons.phone,
                              enabled: _isEditing,
                              type: TextInputType.phone,
                            ),
                            _profileField(
                              label: "New Password",
                              controller: _passwordController,
                              icon: Icons.lock,
                              enabled: _isEditing,
                              obscure: true,
                            ),

                            const SizedBox(height: 10),

                            // ── Save Button (only when editing) ──
                            if (_isEditing)
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                      255,
                                      2,
                                      39,
                                      39,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
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
                                  child: const Text(
                                    "Save Changes",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),

                            const SizedBox(height: 15),

                            // ── Logout Button ────────────────────
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red.shade400,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  Get.dialog(
                                    AlertDialog(
                                      title: const Text("Logout"),
                                      content: const Text(
                                        "Are you sure you want to logout?",
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Get.back(),
                                          child: const Text("Cancel"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Get.offAllNamed('/');
                                          },
                                          child: const Text(
                                            "Logout",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Logout",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
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
          ),
        ],
      ),
    );
  }

  // ── Stat Box ───────────────────────────────────────────
  Widget _statBox(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  // ── Profile Field ──────────────────────────────────────
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
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blue),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: !enabled,
          fillColor: enabled ? null : Colors.grey.shade100,
        ),
      ),
    );
  }
}
