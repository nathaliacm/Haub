import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haub/firebase_tools/usuario.dart';

class Mensagem {
  String _messageId;
  String _senderId;
  String _senderName;
  Timestamp _timestamp;
  String _conversationId;
  String _texto;

  String get messageId => _messageId;
  String get senderId => _senderId;
  String get senderName => _senderName;
  Timestamp get timestamp => _timestamp;
  String get conversationId => _conversationId;
  String get texto => _texto;

  void _setFromDB(String messageId,String senderId,String senderName, String conversationId, Timestamp timestamp) {
    this._messageId = messageId;
    this._senderId = senderId;
    this._senderName = senderName;
    this._conversationId = conversationId;
    this._timestamp = timestamp;
  }

  /*
  void _setFromSend(String senderId,String senderName, String conversationId, DateTime timestamp) {
    this._senderId = senderId;
    this._senderName = senderName;
    this._conversationId = conversationId;
    this._timestamp = timestamp;
  }
  */
}

class Conversa {
  static final CollectionReference todas = 
    FirebaseFirestore.instance.collection('conversas');
  
  DocumentReference _referencia;
  String _conversationId;
  String _firstSender;
  String _lastSender;
  String _lastMessageText;
  List<String> participantes;
  CollectionReference _mensagens;
  DocumentSnapshot _ultimaMensagem;
  
  DocumentReference get referencia => _referencia;
  CollectionReference get mensagens => _mensagens;
  String get ultimoAEnviar => _lastSender;
  String get ultimoTextoMensagem => _lastMessageText;
  String get originadorId => _firstSender;
  String get conversationId => _conversationId;

  Conversa(DocumentSnapshot element) {
    _referencia = element.reference;
    _mensagens = element.reference.collection('mensagens');
    _conversationId = element.id;
    _firstSender = element.data()['firstSender'];
    _lastSender = element.data()['lastSender'];
    _lastMessageText = element.data()['lastMessageText'];
    participantes = List.from(element.data()['participantes']);
    _ultimaMensagem = null;
  }

  Stream<List<Mensagem>> novasMensagens() {
    StreamController<List<Mensagem>> controlador = new StreamController<List<Mensagem>>.broadcast();
    List<Mensagem> mensagens = new List<Mensagem>();

    _mensagens
      .orderBy('timestamp',descending: true)
      .limit(20)
      .snapshots().listen(
          (value) {
            mensagens.clear();
            if (value != null) {
              value.docs.forEach(
                (element) {
                  Mensagem message = Mensagem();
                  print(element.data()['timestamp']);
                  message._setFromDB(
                    element.id,
                    element.data()['senderId'],
                    element.data()['senderName'],
                    element.data()['conversationId'],
                    element.data()['timestamp']
                  );
                  mensagens.add(message);
                }
              );
              _ultimaMensagem = value.docs.last;
            }
            print('chamada mensagens ${mensagens==null}');
            controlador.add(mensagens);
          }
      );
    return controlador.stream;
  }

  Future<void> enviarMensagem(String texto) async {
    Timestamp agora = Timestamp.now();
    _referencia.set({
      'lastTimestamp':agora,
      'lastSender':Usuario.nome,
      'lastMessageText':texto
    });
    await _mensagens.doc().set({
      'senderid':Usuario.id,
      'senderName':Usuario.nome,
      'timestamp':agora,
      'texto':texto
    });
  }

  Future<List<Mensagem>> getNextMessages({bool restart = false}) async {
    List<Mensagem> mensagens;
    if (_ultimaMensagem != null && !restart) {
      await _mensagens
        .orderBy('timestamp',descending: true)
        .startAfterDocument(_ultimaMensagem)
        .limit(20)
        .get().then(
          (value) {
            if (value != null) {
              value.docs.forEach(
                (element) {
                  Mensagem message = Mensagem();
                  message._setFromDB(
                    element.id,
                    element.data()['senderId'],
                    element.data()['senderName'],
                    element.data()['conversationId'],
                    element.data()['timestamp']
                  );
                  mensagens.add(message);
                }
              );
            }
            _ultimaMensagem = value.docs.last;
          }
        );
    } else {
      await _mensagens
        .orderBy('timestamp',descending: true)
        .limit(20)
        .get().then(
          (value) {
            if (value != null) {
              value.docs.forEach(
                (element) {
                  Mensagem message = Mensagem();
                  message._setFromDB(
                    element.id,
                    element.data()['senderId'],
                    element.data()['senderName'],
                    element.data()['conversationId'],
                    element.data()['timestamp']
                  );
                  mensagens.add(message);
                }
              );
            }
            _ultimaMensagem = value.docs.last;
          }
        );
    }
    return mensagens;
  }
}