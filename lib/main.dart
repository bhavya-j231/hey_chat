import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';
import 'screens/splash_screen.dart';

// global object for accessing device screen size
late Size mq;
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // enter full screen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([
   DeviceOrientation.portraitUp,
   DeviceOrientation.portraitDown])
   .then( (value) {
    _initializeFirebase();
  runApp(const MyApp());
   });
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hey Chat',
      theme: ThemeData(
       appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 1,
         iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black , 
        fontWeight: FontWeight.normal ,
        fontSize: 19),
        backgroundColor: Colors.white,
       )
        
      ),
      home: const SplashScreen()
     // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

_initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
);
}

