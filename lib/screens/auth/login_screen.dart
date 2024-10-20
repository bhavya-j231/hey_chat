import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hey_chat/api/apis.dart';
import 'package:hey_chat/helper/dialogs.dart';
import 'package:hey_chat/screens/home_screen.dart';
import '../../main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // variable used to trigger animation directly on opening the login page
  bool _isAnimate = false;

  @override
  void initState() {

    super.initState();
    Future.delayed(Duration(milliseconds: 500), (){
      setState(() {
        // this means after half second 'start the animation'
        _isAnimate = true;
      });
    });
  }

  _handleGoogleBtnClick(){
    // for showing progress bar
    Dialogs.showProgressBar(context);
    _signInWithGoogle().then((user)  {
      // for hiding progress bar
      Navigator.pop(context);
      if(user != null)
      {
          log('\nUser: ${user.user}');
      log('\nUserAdditionalInfo: ${user.additionalUserInfo}');
      Navigator.pushReplacement(
                context, MaterialPageRoute(
                  builder: (_) => const HomeScreen()
              ));
      }
    
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try{
      await InternetAddress.lookup('google.com');
        // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
    final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await APIs.auth.signInWithCredential(credential);
    }catch (e) {
      log('\n_signInWithGoogle: $e');
      Dialogs.showSnackbar(context, 'Oops!! Something went wrong (check internet)');
      return null;
    }
}



  @override
  Widget build(BuildContext context) {
   // mq = MediaQuery.of(context).size;


    return Scaffold(
      // app bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // this adds the home icon at the top left of the home screen
        title: const Text('Welcome to Hey Chat'),
        backgroundColor: Color.fromRGBO(219, 220, 232, 0.075) 
        // the below actions will generate icons like search and three vertical
        // dots on the right hand side
        
      ),
      body: Stack(children: [
        // animated positioned will help to trigger animations but
        // to be used inside stack and 
        // child and duration are must needed
        AnimatedPositioned(
          top: mq.height * .15,
          left: _isAnimate ? mq.width * .25 : -mq.width * .5,
          width: mq.width * .5,
          duration: const Duration(seconds: 2),
          child: Image.asset('images/icon.png')
          ),


        Positioned(
          bottom: mq.height * .15,
          width: mq.width * .9,
          left: mq.width * .05,
          height: mq.height * .06,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 198, 237, 254),
              shape: StadiumBorder(),
              elevation: 1),
            onPressed: () {
              _handleGoogleBtnClick();
            },

            icon: Image.asset('images/google.png', height: mq.height * .04,),

            label: RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: Color.fromARGB(255, 52, 104, 193),
                  fontSize: 15),
              children: [
                TextSpan(text: 'Login with '),
                TextSpan(text: 'Google', 
                  style: TextStyle(fontWeight: FontWeight.w500)
                  ),
        ]
        )
        )
        )
        ),
        ]),
       
    );
  }
}

