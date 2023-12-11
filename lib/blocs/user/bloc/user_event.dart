part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class CreateUserEvent extends UserEvent {
  final UserModel userModel;

  const CreateUserEvent({required this.userModel});

  @override
  List<Object> get props => [userModel];
}
