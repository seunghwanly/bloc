part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object> get props => [];
}

class MessageStarted extends MessageEvent {
  
}

class MessageSent extends MessageEvent {

}

class MessageReceived extends MessageEvent {

  const MessageReceived(this.msg);

  final String msg;

  @override
  List<Object> get props => [this.msg];
}