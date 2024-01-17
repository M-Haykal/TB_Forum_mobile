import 'package:flutter/material.dart';
import 'package:tb_forum/views/login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool isUsernameHovered = false;
  bool isPasswordHovered = false;
  bool isEmailHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Register',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                ),
                MyCustomTextField(
                  controller: _usernameController,
                  labelText: 'Username',
                  icon: Icons.person,
                  isHovered: isUsernameHovered,
                  onEnter: () => setState(() => isUsernameHovered = true),
                  onExit: () => setState(() => isUsernameHovered = false),
                ),
                SizedBox(height: 10),
                MyCustomTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  icon: Icons.email,
                  isHovered: isEmailHovered,
                  onEnter: () => setState(() => isEmailHovered = true),
                  onExit: () => setState(() => isEmailHovered = false),
                ),
                SizedBox(height: 10),
                MyCustomTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  icon: Icons.lock,
                  obscureText: true,
                  isHovered: isPasswordHovered,
                  onEnter: () => setState(() => isPasswordHovered = true),
                  onExit: () => setState(() => isPasswordHovered = false),
                ),
                SizedBox(height: 10),
                MyCustomTextField(
                  controller: _confirmPasswordController,
                  labelText: 'Confirm Password',
                  icon: Icons.lock,
                  obscureText: true,
                  isHovered: isPasswordHovered,
                  onEnter: () => setState(() => isPasswordHovered = true),
                  onExit: () => setState(() => isPasswordHovered = false),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika registrasi di sini
                    // Contoh sederhana: periksa apakah password dan konfirmasi password sama
                    if (_passwordController.text ==
                        _confirmPasswordController.text) {
                      // Password valid, tambahkan logika registrasi di sini
                      // Misalnya, tampilkan pesan sukses atau navigasi ke halaman berikutnya
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Success'),
                          content: Text('Registrasi berhasil.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      // Password tidak sama, tampilkan pesan kesalahan
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Error'),
                          content: Text(
                              'Password dan konfirmasi password tidak cocok.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ],
        ));
  }
}

class MyCustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final bool isHovered;
  final VoidCallback onEnter;
  final VoidCallback onExit;

  const MyCustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.icon,
    this.obscureText = false,
    required this.isHovered,
    required this.onEnter,
    required this.onExit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => onEnter(),
      onExit: (event) => onExit(),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: isHovered ? Colors.blue : Colors.grey,
          ),
          suffixIcon: Icon(icon),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
