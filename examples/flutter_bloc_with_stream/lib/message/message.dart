import 'dart:async';

/// Class which exposes `send` and `receive` method
class Message {
  /// [send] message
  void send(String msg) {

  }
  /// [receive] message
  Stream<String> receive() {
    return Stream.fromFutures([]);
  }
}