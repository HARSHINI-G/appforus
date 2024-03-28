import 'package:flutter/material.dart';
import 'chatbox.dart'; // Assuming Chatbox is correctly imported and defined

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MAIN SCREEN"),
        backgroundColor: const Color(0xFF2F3C7E),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Builder(
              builder: (BuildContext builderContext) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(builderContext).openEndDrawer();
                  },
                  icon: const Icon(Icons.menu),
                  iconSize: 30,
                );
              },
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 224, 227, 255),
        child: ListView(
          children: [
            ListTile(
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: const Text("Setting"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Profile"),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 253, 255, 220),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(50),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              color: const Color(0xFF2F3C7E),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Chatbox()));
                  },
                  style: ElevatedButton.styleFrom(
                    // Use Color() directly
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const SizedBox(
                    width: 420,
                    height: 50,
                    child: Center(
                      child: Text("Harshu Chat",
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
                const SizedBox(height: 56),
                ElevatedButton(
                  onPressed: () {
                    // Handle the press for the second container (TO DO LIST)
                    // Add your logic here
                  },
                  style: ElevatedButton.styleFrom(
                    // Use Color() directly
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const SizedBox(
                    width: 420,
                    height: 50,
                    child: Center(
                      child: Text("To Do List",
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
                const SizedBox(height: 56),
                ElevatedButton(
                  onPressed: () {
                    // Handle the press for the third container (Gallery)
                    // Add your logic here
                  },
                  style: ElevatedButton.styleFrom(
                    // Use Color() directly
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const SizedBox(
                    width: 420,
                    height: 50,
                    child: Center(
                      child: Text("Gallery",
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
