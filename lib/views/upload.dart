import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tb_forum/views/profile_page.dart';

void main() {
  runApp(const AddData());
}

class AddData extends StatelessWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Nambah(
        title: 'Nambah Data',
      ),
    );
  }
}

class Nambah extends StatefulWidget {
  const Nambah({super.key, required this.title});
  final String title;

  @override
  State<Nambah> createState() => Input();
}

class Input extends State<Nambah> {
  String _nama = '';
  String _image = '';

  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Upload',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    final pickedFile = await _imagePicker.getImage(
                        source: ImageSource.gallery);

                    if (pickedFile != null) {
                      setState(() {
                        _image = pickedFile.path;
                      });
                    }
                  },
                  child: Text('Image'),
                ),
                SizedBox(height: 20),
                _image.isNotEmpty
                    ? Image.file(
                        File(_image),
                        height: 140,
                      )
                    : Container(
                        height: 175,
                        color: Colors.grey,
                        child: Center(
                          child: Text('No Image Selected'),
                        ),
                      ),
              ],
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter your post',
                labelText: 'Post name',
              ),
              onChanged: (String value) {
                setState(() {
                  _nama = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Upload'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.file(
                            File(_image),
                            height: 200,
                          ),
                          Text('Post: $_nama'),
                        ],
                      ),
                      actions: [
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context); // Tutup dialog
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage()),
                                );
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
