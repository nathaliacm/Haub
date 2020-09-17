import 'package:flutter/material.dart';
import 'package:haub/models/colorPalette.dart';
import 'package:haub/view/chat_screen/chat_screen.dart';

// ignore: must_be_immutable
class ChatListView extends StatelessWidget {
  List list;
  ChatListView(this.list);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              list[index].name,
              style: TextStyle(color: ColorPalette.textColor),
            ),
            subtitle: Row(
              children: [
                Expanded(
                    child: Text(
                  list[index].lastMessage,
                  overflow: TextOverflow.ellipsis,
                )),
                SizedBox(width: 10),
                Text(list[index].time)
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MyChatPage()));
            },
          );
        });
  }
}
