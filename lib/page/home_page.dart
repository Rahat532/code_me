
import 'package:chat_system/Service/auth/auth_service.dart';
import 'package:chat_system/Service/chat/chat_service.dart';
import 'package:chat_system/components/my_drawer.dart';
import 'package:chat_system/components/user_tile.dart';
import 'package:chat_system/page/chat_page.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
   HomePage({super.key});

  // Chat & auth service
  final ChatService _chatService= ChatService();
  final AuthService _authService=AuthService();

  void logout()
  {
    final auth =AuthService();
    auth.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Home"),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.amberAccent,
        elevation: 0,
      ),
      drawer: const MyDrawer (),
      body: _buildUserList(),
      backgroundColor: Colors.grey.shade600,
    );
  }
  //build a list of users except for the current logged in user
Widget _buildUserList()
{
  return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context,snapshot){
        // error
        if(snapshot.hasError)
          {
            return const Text("Error");
          }
        // loading...
        if(snapshot.connectionState == ConnectionState.waiting)
          {
            return const Text("Loading......");
          }
        //return the Listview
        return ListView(
          children: snapshot.data!.map<Widget>((userData) =>_buildUserListItem(userData,context)).toList(),
        );
      },
  );
}
  //build individual list tile for user
Widget _buildUserListItem(Map<String,dynamic>userData,BuildContext context)
{
  //display all users except current user
   if(userData["email"]!= _authService.getCurrentUser()!.email){
     return UserTile(
       text: userData["email"],
       onTap: (){
         //tapped on a user -> go to chat Page
         Navigator.push(context,MaterialPageRoute(builder: (context) => ChatPage(
           receiveEmail: userData["email"],
           receiverID: userData["uid"],
         ),
         ),
         );
       },
     );
   }else {
     return Container();
   }

}


}
