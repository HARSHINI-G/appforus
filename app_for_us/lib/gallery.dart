import 'package:flutter/material.dart';
import 'package:app_for_us/imageinsertion.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          // Navigate to the next page
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ImageInsertion()), // Updated reference
          );
        },
        child: const Icon(
          Icons.image,
          color: Colors.white60,
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 82, 79, 167),
        title: const Text('GALLERY'),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Gallery',
      theme: ThemeData.dark(),
      home: const Gallery(),
      routes: {
        ImageInsertion.routeName: (context) => const ImageInsertion(),
      },
    ),
  );
}
