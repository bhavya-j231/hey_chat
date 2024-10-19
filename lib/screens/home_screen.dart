import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBar(
        // this adds the home icon at the top left of the home screen
        leading: Icon(CupertinoIcons.home),
        title: const Text('Hey Chat'),
        backgroundColor: Color.fromRGBO(67, 69, 68, 0.086) ,
        // the below actions will generate icons like search and three vertical
        // dots on the right hand side
        actions: [
          IconButton(onPressed: (){ }, icon: const Icon(Icons.search)),
          IconButton(onPressed: (){ }, icon: const Icon(Icons.more_vert))
        ],
      ),

        // the bottom comment add icon was not properly padded so we padded it
        // using ctrl+shift+R and wrap in padding
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10 , right: 5),
        child: FloatingActionButton(
          onPressed: (){ },
         child: const Icon(
          Icons.add_comment_rounded
          )
          ),
      ),
    );
  }
}

