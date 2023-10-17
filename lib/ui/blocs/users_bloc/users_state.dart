part of 'users_bloc.dart';

class UserState extends Equatable {
  final int userCount;

  UserState({this.userCount = 10});

  UserState copyWith({int? userCount}) => UserState(
        userCount: userCount ?? this.userCount,
      );
  @override
  List<Object?> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UsersLoadedState extends UserState {
  UsersLoadedState(this.users, {this.userCount = 10});
  final int userCount;

  final List<Users> users;
  @override
  List<Object?> get props => [users];
}

class UsersErrorState extends UserState {
  UsersErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}

class PostsLoadedState extends UserState {
  PostsLoadedState(this.posts);

  final List<Post> posts;
  @override
  List<Object?> get props => [posts];
}
