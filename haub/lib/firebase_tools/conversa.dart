import 'package:cloud_firestore/cloud_firestore.dart';

class Mensagem {
  String _id;
  String _senderId;
  String _senderName;
  DateTime _timestamp;
  String _conversationId;
  String _texto;

  String get messageId => _id;
  String get senderId => _senderId;
  String get senderName => _senderName;
  DateTime get timestamp => _timestamp;
  String get conversationId => _conversationId;
  String get texto => _texto;

  void _setFromDB(messageId,senderId,senderName,conversationId,timestamp) {
    this._id = messageId;
    this._senderId = senderId;
    this._senderName = senderName;
    this._conversationId = conversationId;
    this._timestamp = timestamp;
  }

  void _setFromSend(senderId,senderName,conversationId,timestamp) {
    this._senderId = senderId;
    this._senderName = senderName;
    this._conversationId = conversationId;
    this._timestamp = timestamp;
  }
}

class Conversa {
  String _conversationId;
  List<String> participantes;
  CollectionReference _mensagens;
  DocumentSnapshot _ultimaMensagem;

  Conversa(this._conversationId, String idParticipante) {
    _mensagens = FirebaseFirestore.instance.collection('conversas')
    .doc(_conversationId).collection('mensagens');
    _fetchConversationData(idParticipante);
  }

  Future<void> _fetchConversationData(participant) async {
    DocumentSnapshot colecao = await FirebaseFirestore.instance.collection('conversas').doc(_conversationId).get();
    List<String> participantes = List.from(colecao.data()['participants']);
    if (participantes.contains(participant)) {
      this.participantes = participantes;
    }
  }

  Future<List<Mensagem>>_fetchMessages({DocumentSnapshot lastMessage}) async {
    if (lastMessage != null) {
      List<Mensagem> mensagens = await FirebaseFirestore.instance
        .collection('conversas').doc(_conversationId)
        .collection('mensagens')
        .orderBy('timestamp')
        .startAfterDocument(lastMessage)
        .limit(20)
        .get();
    }
  }
}