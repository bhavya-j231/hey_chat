import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hey_chat/main.dart';

class ChatUserCard extends StatefulWidget {
  const ChatUserCard({super.key});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: mq.width * .04,
        vertical: 4),
       // color: const Color.fromARGB(255, 241, 191, 239),
        elevation: 0.75,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {},
        child: const ListTile(
          // user profile picture
          leading: CircleAvatar(child: Icon(CupertinoIcons.person)),

          // user name
          title: Text('Demo User'),

          // last message
          subtitle: Text('Last user message', maxLines: 1),

          // last message time
          trailing: Text('10:52 AM',
          style: TextStyle(color: Colors.black54)
          )
        ),
      ),
    );
  }
}