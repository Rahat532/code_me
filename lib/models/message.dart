import 'package:cloud_firestore/cloud_firestore.dart';
class Message{
  final String senderID;
  final String  SenderEmail;
  final String  receiverID;
  final String message;
  final Timestamp timestamp;
  Message({
    required this.senderID,
    required this.SenderEmail,
    required this.receiverID,
    required this.message,
    required this.timestamp,
});
// convart to a map
Map<String, dynamic>toMap(){
  return{
    'senderID': senderID,
    'SenderEmail':SenderEmail,
    'receiverID':receiverID,
    'message' :message,
    'timestamp':timestamp,
  };
}

}