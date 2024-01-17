import 'package:flutter/material.dart';
import 'package:tb_forum/views/message_page.dart';
import 'package:tb_forum/views/setting_page.dart';
import 'package:tb_forum/views/profile_page.dart';
import 'package:tb_forum/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class ProductCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;

  ProductCard({
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(name),
        subtitle: Text(description),
      ),
    );
  }
}

class likesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          height: 40, 
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain, 
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
                  MaterialPageRoute(builder: (context) => likesPage()),
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
      body: ListView(
        children: [
          ProductCard(
            name: 'Haii Tb_forum',
            description: 'rafiramzi2 menyukai konten anda',
            imageUrl: 'assets/images/smk.jpg',
          ),
          ProductCard(
            name: 'Haii Tb_forum',
            description: 'andyto menyukai konten anda',
            imageUrl: 'assets/images/smk.jpg',
          ),
          ProductCard(
            name: 'Haii Tb_forum',
            description:
                'rafiftro menyukai konten anda',
            imageUrl: 'assets/images/smk.jpg',
          ),
        ],
      ),
    );
  }
}
