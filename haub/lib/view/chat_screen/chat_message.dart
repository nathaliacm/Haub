import 'package:flutter/material.dart';
import 'package:haub/firebase_tools/usuario.dart';
import 'package:haub/models/colorPalette.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage(this.data, this.mine);

  final Map<String, dynamic> data;
  final bool mine;

  Widget box(String nomeUser, Color colorP, CrossAxisAlignment position,
      TextAlign alinhamento) {
    Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Center(
                  child: Ink(
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          color: colorP),
                      child: Column(
                          crossAxisAlignment: position,
                          children: <Widget>[
                            Text(
                              data['text'],
                              textAlign: alinhamento,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              data[nomeUser],
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ]))))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return mine
        ? box(Usuario.nome, ColorPalette.chatSenderColor,
            CrossAxisAlignment.end, TextAlign.end)
        : box(Usuario.nome, ColorPalette.chatReceivedColor,
            CrossAxisAlignment.start, TextAlign.start);
  }
}
