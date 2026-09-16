abstract class ChatRepository {
  void sendMessage(String msg);
  void listenMessages(void Function(dynamic) handler);
}
