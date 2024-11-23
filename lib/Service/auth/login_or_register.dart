import 'package:chat_system/page/login_page.dart';
import 'package:chat_system/page/register_page.dart';
import 'package:flutter/material.dart';
class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initial Show Login page
  bool showLoginPage=true;

  //Toggle between login an Register page
  void togglePage()
  {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
   if(showLoginPage){
     return LoginPage(
       onTap: togglePage,
     );
   }
   else
     {
       return RegisterPage(
         onTap: togglePage,
       );
     }
  }
}
