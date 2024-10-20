import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hey_chat/api/apis.dart';
import 'package:hey_chat/main.dart';
import 'package:hey_chat/widgets/chat_user_card.dart';


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
        backgroundColor: Color.fromRGBO(6, 20, 215, 0.078) ,
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
          onPressed: () async {  
            await APIs.auth.signOut();
            await GoogleSignIn().signOut(); 
          },
         child: const Icon(
          Icons.add_comment_rounded
          )
          ),
      ),

      body: ListView.builder(
        itemCount: 5,
        padding: EdgeInsets.only(top: mq.height * .02),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index){
        return const ChatUserCard();
      }) ,
    );
  }
}

