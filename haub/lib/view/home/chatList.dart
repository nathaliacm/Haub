import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:haub/firebase_tools/conversa.dart';
import 'package:haub/firebase_tools/usuario.dart';
import 'package:haub/models/colorPalette.dart';
import 'package:haub/view/chat_screen/chat_screen.dart';

// ignore: must_be_immutable
class ChatListView extends StatelessWidget {
  List<QueryDocumentSnapshot> list = new List<QueryDocumentSnapshot>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Conversa.todas
        .where('participantes',arrayContains:Usuario.id)
        .orderBy('lastTimestamp',descending: true)
        .limit(5)
        .snapshots(),
      builder:
        (context, conversas) {
          list.clear();
          if (conversas.data != null) {conversas.data.docs.forEach((element) {list.add(element);});}
          return ListView.builder(
            padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  list[index].data()['lastSender'],
                  style: TextStyle(color: ColorPalette.textColor),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                        child: Text(
                          list[index].data()['lastMessageText'],
                          overflow: TextOverflow.ellipsis,
                    )),
                    SizedBox(width: 10),
                    //Text(list[index].data()['lastTimestamp'])
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MyChatPage(Conversa(list[index]))));
                },
              );
            });
        }
        
    );
  }
}
