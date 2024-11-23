import 'package:chat_system/Service/auth/login_or_register.dart';
import 'package:chat_system/page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshort)
        {

          // user log in
          if(snapshort.hasData)
            {
              return  HomePage();
            }
          //user not log in
          else{
            return const LoginOrRegister();
          }
        },

      ),
    );
  }
}
