import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haub/firebase_tools/conversa.dart';
import 'package:haub/firebase_tools/usuario.dart';
import 'package:haub/models/colorPalette.dart';
import 'package:haub/view/chat_screen/chat_screen.dart';


class ChatListView extends StatefulWidget {
  bool minhasDuvidas;
  Stream<List<Conversa>> convStream;

  ChatListView(this.minhasDuvidas);

  @override
  _ChatListViewState createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  @override
  void initState() {
    widget.convStream = Usuario.conversas(minhasDuvidas:widget.minhasDuvidas);
    print('initializing');
    super.initState();
  }

  @override
  void dispose() {
    print('disposing');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Conversa>>(
        stream: widget.convStream,
        builder:
          (context, conversas) {
              print('${conversas.data==null}');
              if (conversas.data == null) {
                return CircularProgressIndicator();
              } else {
              return ListView.builder(
                padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                itemCount: conversas.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      //Texto superior
                      conversas.data[index].ultimoAEnviar,
                      style: TextStyle(color: ColorPalette.textColor),
                    ),
                    subtitle: Row(
                      children: [
                        Expanded(
                            child: Text(
                              conversas.data[index].ultimoTextoMensagem,
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
                              builder: (BuildContext context) => MyChatPage(conversas.data[index])));
                    },
                  );
                });
              }
          } 
        );
    }
}
