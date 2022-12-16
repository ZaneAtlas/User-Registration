import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:user_registration/pages/homepage.dart';
import 'package:user_registration/pages/login.dart';
import 'package:user_registration/pages/register.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => Register(),
        '/home': (context) => HomeScreen(),
      },
      home: OnboardingPage(),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Lottie.network(
              'https://assets3.lottiefiles.com/packages/lf20_q5pk6p1k.json'),
        ),
        Text(
          'Welcome to the app',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 50.0,
        ),
        TextButton(
            style: flatButtonStyle,
            onPressed: () => Navigator.pushNamed(context, '/login'),
            child: Text("Get started", style: TextStyle(color: Colors.white)))
      ],
    ));
  }
}
