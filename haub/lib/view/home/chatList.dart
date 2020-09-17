import 'package:flutter/material.dart';
import 'package:haub/firebase_tools/conversa.dart';
import 'package:haub/firebase_tools/usuario.dart';
import 'package:haub/models/colorPalette.dart';
import 'package:haub/view/chat_screen/chat_screen.dart';

// ignore: must_be_immutable
class ChatListView extends StatelessWidget {
  bool minhasDuvidas;
  
  ChatListView(this.minhasDuvidas);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Conversa>>(
      stream: Usuario.conversas(minhasDuvidas:this.minhasDuvidas),
      builder:
        (context, conversas) {
          return ListView.builder(
            padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
            itemCount: conversas.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
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
        
    );
  }
}
