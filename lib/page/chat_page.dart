
import 'package:chat_system/Service/auth/auth_service.dart';
import 'package:chat_system/Service/chat/chat_service.dart';
import 'package:chat_system/components/Chat_bubble.dart';
import 'package:chat_system/components/my_textfild.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class ChatPage extends StatelessWidget {
  final String receiveEmail;
  final String receiverID;

   ChatPage({super.key,
  required this.receiveEmail,
    required this.receiverID,
  });
// text controller
  final TextEditingController _messageController= TextEditingController();
  //chat & auth services
  final ChatService _chatService= ChatService();
  final AuthService _authService=AuthService();
  // sent message
  void sendMessage()
async  {
            //if something inside the textfield
  if(_messageController.text.isNotEmpty){
    //send the message
    await _chatService.sendMessage(receiverID,_messageController.text);
    //clear text controller
    _messageController.clear();
  }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receiveEmail),),
      body:Column(
        children: [
          //display all messages
          Expanded(child: _buildMessageList(),),
          //user input
          _buildUserInput(),
        ],
      ),
      backgroundColor: Colors.grey.shade600,
    );
  }
  // Build Message List
Widget _buildMessageList()
{
  String senderID=_authService.getCurrentUser()!.uid;
  return StreamBuilder(
      stream: _chatService.getMessages(receiverID,senderID),
      builder: (context,snapshot){
    //errors
    if(snapshot.hasError)
      {
        return const Text("Error!");
      }
    //loadin
        if(snapshot.connectionState== ConnectionState.waiting){
          return const Text("Loading___^^^__^^__");
        }
        //return list view
        return ListView(
          children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
  },
  );
}
 //Build message Item
Widget _buildMessageItem(DocumentSnapshot doc){
    Map<String,dynamic>data=doc.data() as Map<String,dynamic>;
    //is current User
    bool isCurrentUser=data['senderID'] == _authService.getCurrentUser()!.uid;


    //aliign message to the right if sender is current user
    var alignment=
        isCurrentUser ? Alignment.centerRight: Alignment.centerLeft;

    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end:CrossAxisAlignment.start,
          children: [
           ChatBubble(message: data["message"], isCurrentUser: isCurrentUser,
           )
          ],
        ));
}


//build message input
Widget _buildUserInput(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: Row(children: [
        //Textfield shoud thake most of spase
         Expanded(child: Mytextfild(
       controller: _messageController,
       hintTex: "Type it Already !",
       obscureText: false,
         ),),
        //send button
        Container(
          decoration: BoxDecoration(color:Colors.pink.shade200,
          shape: BoxShape.circle,),
          margin: const EdgeInsets.only(right: 25),
          child: IconButton(onPressed: sendMessage,
              icon:Icon(Icons.message,color:Colors.pink.shade50,),),
        ),
      ],
      ),
    );
}
}
