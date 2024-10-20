import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hey_chat/api/apis.dart';
import 'package:hey_chat/screens/home_screen.dart';

import '../../main.dart';
import 'auth/login_screen.dart';

// splash screen 
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // variable used to trigger animation directly on opening the login page

  @override
  void initState() {

    super.initState();
    Future.delayed(Duration(milliseconds: 3000), (){

      // exit full screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent
          ));
          
          if(APIs.auth.currentUser != null){
        log('\nUser: ${APIs.auth.currentUser}');

          // navigate to home screen
          Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          } else {
          // navigate to login screen
          Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const LoginScreen()));
          }


     
      
    });
  }


  @override
  Widget build(BuildContext context) {

    // initializing media query for getting device screen size
    mq = MediaQuery.of(context).size;


    return Scaffold(
      
      // body
      body: Stack(children: [
        // animated positioned will help to trigger animations but
        // to be used inside stack and 
        // child and duration are must needed
        Positioned(
          top: mq.height * .15,
          right:  mq.width * .25,
          width: mq.width * .5,

          child: Image.asset('images/icon.png')
          ),


        Positioned(
          bottom: mq.height * .15,
          left: mq.width * .20,
          width: mq.width,
        
          child: const Text('Made By Bhavya Jha 😊\n Roll no : 234G1A0525',
          
          style: TextStyle(fontSize: 20 ,
          color: Color.fromARGB(255, 2, 126, 66),
          letterSpacing:.5 ),),
        ),
        ]),
       
    );
  }
}

