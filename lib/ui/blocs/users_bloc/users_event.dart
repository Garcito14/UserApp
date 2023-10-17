part of 'users_bloc.dart';

sealed class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class GetUsersEvent extends UsersEvent {
  GetUsersEvent();
}

class UserDeleted extends UsersEvent {
  final int userCount;
  UserDeleted(this.userCount);
}
