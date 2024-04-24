import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketManager {
  static IO.Socket? socket;

  static void connectToServer() {
    const String serverUrl = 'https://ysvnfos.altisss.vn';
    socket = IO.io(
        serverUrl,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .setPath("/services")
            .disableAutoConnect()
            .build());

    socket!.onConnect((_) {
      print('Connected to server');
    });

    socket!.onConnectError((error) {
      print('Connection error: $error');
    });

    socket!.on('RES_MSG', (inputServiceBodyJson) {
      print(inputServiceBodyJson);
    });

    socket!.connect();
  }

  static void disconnectFromServer() {
    if (socket != null) {
      socket!.disconnect();
    }
  }
}
