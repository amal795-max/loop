import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  void connect(String url) {
    socket = IO.io(
      url,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build(),
    );
    socket.connect();
  }

  void emit(String event, dynamic data) => socket.emit(event, data);

  void on(String event, void Function(dynamic) handler) =>
      socket.on(event, handler);

  void off(String event) => socket.off(event);

  void dispose() => socket.dispose();
}
