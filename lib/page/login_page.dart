import 'package:chat_system/Service/auth/auth_service.dart';
import 'package:chat_system/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:chat_system/components/my_textfild.dart';
class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  //tap go to register page
  final void Function() ? onTap;
  LoginPage({super.key,required this.onTap});
  //Login Page
  void login(BuildContext context) async {
   //auth service
    final authService = AuthService();
    // try login
    try{
       await authService.singinWithEmailPassword(_emailController.text, _passController.text,);
    }
    // Catch any errors
    catch(e)
    {
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ),);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.messenger_outlined, size: 80, color: Colors.amber),
            const SizedBox(height: 30),
            Text(
              "Welcome Back, You have been Missed!",
              style: TextStyle(
                color: Colors.deepPurple.shade50,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),
            Mytextfild(
              hintTex: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(height: 10),
            Mytextfild(
              hintTex: "Password",
              obscureText: true,
              controller: _passController,
            ),

            const SizedBox(height: 25),
            //login  button
            MyButton(
              text: "Login",
              onTap: ()=>login(context),
            ),
            // register now
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Not a member?",
                  style:
                  TextStyle(color: Colors.black),),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(" Register now",style: TextStyle(
                    fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}


