import 'dart:io';
import 'package:flutter/material.dart';
import 'package:app_for_us/image.dart';

class ImageInsertion extends StatefulWidget {
  static const String routeName = 'imageinsertion';

  const ImageInsertion({super.key}); // Define routeName property

  @override
  _ImageInsertionState createState() => _ImageInsertionState();
}

class _ImageInsertionState extends State<ImageInsertion> {
  final _titleController = TextEditingController();
  final _storyController = TextEditingController();
  late File savedImage;

  static const routeName = "imageinsertion";

  void onSave() {
    if (_titleController.text.isEmpty ||
        _storyController.text.isEmpty) {
      return;
    } else {
      print(_titleController.text);
      print(_storyController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert Image'),
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
            onPressed: onSave,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: _storyController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ImageInput((File imageFile) {
              setState(() {
                savedImage = imageFile;
              });
            }),
          ],
        ),
      ),
    );
  }
}
