import 'package:flutter/material.dart';
import 'package:tb_forum/views/profile_page.dart';
import 'package:tb_forum/views/message_page.dart';
import 'package:tb_forum/views/setting_page.dart';
import 'package:tb_forum/views/likes_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedPage = '';
  TextEditingController _searchController = TextEditingController();

  List<Post> allPosts = List.generate(
    5,
    (index) => Post(
      username: 'Tb_forum',
      location: 'SMK Taruna Bhakti',
      imageUrl: 'assets/images/smk.jpg',
      likes: 100,
      caption: 'Caption $index',
    ),
  );

  List<Post> filteredPosts = [];

  @override
  void initState() {
    super.initState();
    filteredPosts = allPosts;
  }

  void searchPosts(String query) {
    setState(() {
      filteredPosts = allPosts
          .where((post) =>
              post.username.toLowerCase().contains(query.toLowerCase()) ||
              post.caption.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (query) => searchPosts(query),
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ...filteredPosts.map((post) => Card(
                margin: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage()),
                              );
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(
                                      'https://cdn-icons-png.flaticon.com/512/2919/2919906.png'),
                                ),
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      post.username,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(post.location),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              // Handle menu item selection
                              print('Selected: $value');
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 'Report',
                                child: Text('Report'),
                              ),
                              PopupMenuItem(
                                value: 'Save',
                                child: Text('Save'),
                              ),
                              // Add more options as needed
                            ],
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      post.imageUrl,
                      fit: BoxFit.cover,
                      height: 300,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.favorite_border),
                              SizedBox(width: 8),
                              Icon(Icons.chat_bubble_outline),
                              SizedBox(width: 8),
                              Icon(Icons.send_sharp),
                            ],
                          ),
                          Text("1 Like"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${post.likes} likes'),
                          SizedBox(height: 4),
                          Text(
                            post.caption,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class Post {
  final String username;
  final String location;
  final String imageUrl;
  final int likes;
  final String caption;

  Post({
    required this.username,
    required this.location,
    required this.imageUrl,
    required this.likes,
    required this.caption,
  });
}
