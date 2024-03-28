import 'package:app_for_us/chat.dart';
import 'package:app_for_us/to_do_list.dart';
import 'package:app_for_us/gallery.dart';
import 'package:flutter/material.dart'; // Updated import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter App with Settings',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 210, 194, 52),
        title: const Text('PERSONAL APP'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              _showSettingsDialog(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            // Container 1 as a button
            GestureDetector(
              onTap: () {
                // Navigate to the next page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const chat()), // Updated reference
                );
              },
              child: Container(
                width: 500,
                height: 200,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                ),
                child: const Text(
                  'CHAT BOX',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
              ),
            ),

            // Container 2 as a button
            GestureDetector(
              onTap: () {
                // Navigate to the next page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ToDoList()), // Updated reference
                );
              },
              child: Container(
                width: 500,
                height: 200,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                ),
                child: const Text(
                  'TO-DO LIST',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
              ),
            ),

            // Container 3 as a button
            GestureDetector(
              onTap: () {
                // Navigate to the next page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Gallery()), // Updated reference
                );
              },
              child: Container(
                width: 500,
                height: 200,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                ),
                child: const Text(
                  'GALLERY',
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showSettingsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Settings'),
        content: Column(
          children: [
            ListTile(
              title: const Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Invite friends'),
              onTap: () {},
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}
