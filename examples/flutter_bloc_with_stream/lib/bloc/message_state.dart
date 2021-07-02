part of 'message_bloc.dart';

abstract class MessageState extends Equatable {
  const MessageState();

  @override
  List<Object> get props => [];
}

class MessageInitial extends MessageState {

}

class MessageSuccess extends MessageState {
  const MessageSuccess(this.statusCode, this.msg);

  final int statusCode;
  final String msg;

  @override
  List<Object> get props => [statusCode, msg];
}