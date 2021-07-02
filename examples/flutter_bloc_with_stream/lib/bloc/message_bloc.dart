import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_with_stream/message/message.dart';

part 'message_event.dart';
part 'message_state.dart';


class MessageBloc extends Bloc<MessageEvent, MessageState> {

  MessageBloc(this._msg) : super(MessageInitial());

  final Message _msg;
  StreamSubscription? _subscription;

  @override
  Stream<MessageState> mapEventToState(MessageEvent event) async* {
    if (event is MessageStarted) {
      /// `cancel` previous events
      await _subscription?.cancel();
      /// `receive` msg : new start
      _subscription = _msg.receive().listen((data) => add(MessageReceived(data)));
    }
    /// [TODO] check event to know whether msg has arrived successfully
    else if (event is MessageSent) {
      /// using `yield`, keep stream alive
      yield MessageSuccess(event.hashCode, event.props.first.toString());
    } else if (event is MessageReceived) {
      yield MessageSuccess(event.hashCode, event.props.first.toString());
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}