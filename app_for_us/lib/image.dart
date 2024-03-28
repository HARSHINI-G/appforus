import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  final Function imagesaveat;
  const ImageInput(this.imagesaveat, {super.key});

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _imageFile;

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 600);
    if (imageFile == null) {
      return;
    }
    setState(() {
      _imageFile = File(imageFile.path); // corrected assignment
    });
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final saveImagePath = await _imageFile!.copy('${appDir.path}/$fileName');

    widget.imagesaveat(File(saveImagePath.path));
  }

  Future<void> _galleryPicture() async {
    final imageFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxWidth: 600);
    if (imageFile == null) {
      return;
    }
    setState(() {
      _imageFile = File(imageFile.path); // corrected assignment
    });
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final saveImagePath = await _imageFile!.copy('${appDir.path}/$fileName');

    widget.imagesaveat(File(saveImagePath.path));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.deepPurple),
          ),
          child: _imageFile != null
              ? Image.file(
                  _imageFile!,
                  fit: BoxFit.cover,
                )
              : const Center(
                  child: Text('No image yet'),
                ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                _galleryPicture(); // call _galleryPicture method here
              },
              child: const Row(
                children: [
                  Icon(Icons.image),
                  SizedBox(width: 8), // Add some space between icon and text
                  Text('Choose from gallery'),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                _takePicture(); // call _takePicture method here
              },
              child: const Row(
                children: [
                  Icon(Icons.camera_alt),
                  SizedBox(width: 8), // Add some space between icon and text
                  Text('Take a picture'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
