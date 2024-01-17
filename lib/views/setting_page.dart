import 'package:flutter/material.dart';
import 'package:tb_forum/views/login_page.dart';
import 'package:tb_forum/views/message_page.dart';
import 'package:tb_forum/views/setting_page.dart';
import 'package:tb_forum/views/profile_page.dart';
import 'package:tb_forum/views/home_page.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          height: 40, // Sesuaikan dengan tinggi yang diinginkan
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain, // Sesuaikan dengan gaya yang diinginkan
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Image(image: AssetImage('assets/images/logo.png'))),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Messages'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MessagePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Likes'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Text('Halaman Like')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'General Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Dark Mode'),
              trailing: Switch(
                value: false,
                onChanged: (value) {
                  // Handle the switch change
                  // Misalnya: set nilai pada variabel atau panggil metode yang sesuai.
                },
                activeTrackColor: Colors.lightBlueAccent,
                activeColor: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Notification'),
              trailing: Switch(
                value: true,
                onChanged: (value) {
                  // Handle the switch change
                  // Misalnya: set nilai pada variabel atau panggil metode yang sesuai.
                },
                activeTrackColor: Colors.lightBlueAccent,
                activeColor: Colors.blue,
              ),
            ),
            Divider(
              color: Colors.blue,
            ),
            Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Change Password'),
                  Icon(
                    Icons.lock,
                    color: Colors.blue,
                  ),
                ],
              ),
              onTap: () {
                // Handle the "Change Password" action
                // Misalnya: Tampilkan dialog ganti kata sandi.
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Logout'),
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.blue,
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
