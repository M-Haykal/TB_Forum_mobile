import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tb_forum/views/home_page.dart';
import 'package:tb_forum/views/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Color(0xFF0D0826)), 
          bodyText2: TextStyle(color: Color(0xFF0D0826)), 
        ),
        backgroundColor: Color(0xFFF1F1F1), 
        primaryColor: Color(0xFF1E1259), 
        secondaryHeaderColor: Color(0xFFD5DBE2), 
        hintColor: Color(0xFF3B82F6), 
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isUsernameHovered = false;
  bool isPasswordHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Login',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 150,
              ),
              SizedBox(height: 20),
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
                controller: _passwordController,
                labelText: 'Password',
                icon: Icons.lock,
                obscureText: true,
                isHovered: isPasswordHovered,
                onEnter: () => setState(() => isPasswordHovered = true),
                onExit: () => setState(() => isPasswordHovered = false),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_usernameController.text == 'TBFORUM' &&
                      _passwordController.text == '123') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content: Text('Username atau password salah.'),
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
                child: Text('Login'),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: DefaultTextStyle.of(context).style.copyWith(
                        fontSize: 14,
                        color: Colors.black, 
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Register',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ),
                          );
                        }
                        ..onTapCancel =
                            () {}, 
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
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
