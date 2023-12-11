part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoadingState extends UserState {}

final class UserLoadedState extends UserState {
  final UserResponseModel userResponseModel;

  const UserLoadedState({required this.userResponseModel});

  @override
  List<Object> get props => [userResponseModel];
}

final class UserErrorState extends UserState {
  final String errorMessage;
  const UserErrorState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
