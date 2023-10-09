import 'package:equatable/equatable.dart';

abstract class SecureStorageBlocEvent extends Equatable {
  const SecureStorageBlocEvent(this.email);
  final String email;

  @override
  List<Object> get props => [email];
}

//Save E-Mail Event
class SaveEmailEvent extends SecureStorageBlocEvent {
  const SaveEmailEvent(String email) : super(email);
}
