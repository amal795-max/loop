import '../../socket/socket_service.dart';
import 'chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final SocketService socket;

  ChatRepositoryImpl(this.socket);

  @override
  void sendMessage(String msg) {
    socket.emit('chat:send', msg);
  }

  @override
  void listenMessages( void Function(dynamic) handler) {
    socket.on('chat:message', handler);
  }
}
