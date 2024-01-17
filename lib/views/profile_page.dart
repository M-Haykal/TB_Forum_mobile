import 'package:flutter/material.dart';
import 'package:tb_forum/views/upload.dart';
import 'package:tb_forum/views/message_page.dart';
import 'package:tb_forum/views/setting_page.dart';
import 'package:tb_forum/views/profile_page.dart';
import 'package:tb_forum/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class Post {
  final String imageUrl;

  Post({required this.imageUrl});
}

class ProfilePage extends StatelessWidget {
  final List<Post> posts = [
    Post(
        imageUrl:
            'https://i.pinimg.com/236x/51/e4/e9/51e4e9572fdceb1e65baa81564cce899.jpg'),
    Post(
        imageUrl:
            'https://i.pinimg.com/564x/a5/93/97/a59397189ce7c0687782e5f9a99c41df.jpg'),
    Post(
        imageUrl:
            'https://i.pinimg.com/564x/d4/4d/3e/d44d3ee1e2eca9b47e139fbb63ef8056.jpg'),
    Post(
        imageUrl:
            'https://i.pinimg.com/564x/d4/4d/3e/d44d3ee1e2eca9b47e139fbb63ef8056.jpg'),
  ];
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Profile Info
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/2919/2919906.png',
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tb_forum',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text('4 Posts | 100 Followers | 50 Following'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddData()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 8),
                      Text('Upload'),
                    ],
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Icon(Icons.grid_on_outlined),
                    ),
                  ),
                ),
                Container(
                  height: 24.0,
                  width: 1.0,
                  color: Colors.black,
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Icon(Icons.bookmark_border_outlined),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
              ),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Image.network(
                    posts[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Profile Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}
