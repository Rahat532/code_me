import 'package:chat_system/Service/auth/auth_service.dart';
import 'package:chat_system/components/my_button.dart';
import 'package:chat_system/components/my_textfild.dart';
import 'package:flutter/material.dart';
class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confipassController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  // go to the login page
  final void Function() ? onTap;
  RegisterPage({super.key,required this.onTap});
  void register(BuildContext context)
  {
 // get auth service
    final _auth =AuthService();
    //passwords match-> create user
    if(_passController.text == _confipassController.text) {
      try{
        _auth.singUpWithEmailPassword(_emailController.text,_passController.text);
      }
      catch(e){
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),);
      }
    }
    else{
      showDialog(context: context, builder: (context) => const AlertDialog(
        title: Text("Passwords don't match!"),
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
              "Lets Create an account for you!!",
              style: TextStyle(
                color: Colors.deepPurple.shade50,
                fontSize: 19,
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
            const SizedBox(height: 10),
            Mytextfild(
              hintTex: "Confirm Password",
              obscureText: true,
              controller: _confipassController,
            ),
            const SizedBox(height: 10),
            Mytextfild(
              hintTex: "Name",
              obscureText: true,
              controller: _nameController,
            ),
            const SizedBox(height: 25),
            //login  button
            MyButton(
              text: "Register",
              onTap: ()=> register(context),
            ),
            // register now
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have a account?",
                  style:
                  TextStyle(color: Colors.black),),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(" Login now",style: TextStyle(
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
