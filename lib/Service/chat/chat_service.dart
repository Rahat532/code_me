import 'package:chat_system/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService{
  // Get an instance of Firestore & auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth  _auth= FirebaseAuth.instance;

  // Get user stream
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      // Go through each document in the snapshot and map to a list of user data
      return snapshot.docs.map((doc) {
        return doc.data();
      }).toList();
    });
  }

  //send message
Future<void>sendMessage(String receiverId,message)async{
    //get current user info
  final String currentUserID =_auth.currentUser!.uid;
  final String currentUserEmail=_auth.currentUser!.email!;
  final Timestamp timestamp = Timestamp.now();
  //create a new message
  Message newMessage= Message(
      senderID: currentUserID,
      SenderEmail: currentUserEmail,
      receiverID: receiverId,
    message: message,
    timestamp: timestamp,);
  //construct chat room Id for the two user (sorted to ensure Uniqueness)
  List<String>ids=[currentUserID,receiverId];
  ids.sort();
  String chatRoomID=ids.join('_');
  // add new message to database
  await _firestore.collection("chat_rooms").doc(chatRoomID).collection("messages").add(newMessage.toMap());
}
  //get messages
Stream<QuerySnapshot>getMessages(String userID,otherUserID){
    //constrat Id for to users
  List<String>ids=[userID,otherUserID];
  ids.sort();
  String chatRoomId=ids.join("_");
  return _firestore.collection("chat_rooms").doc(chatRoomId).collection("messages").orderBy("timestamp",descending: false).snapshots();
}

}