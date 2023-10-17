part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

class PostsLoadingState extends PostState {}

class PostsLoadedState extends PostState {
  PostsLoadedState(this.posts);

  final List<Post> posts;
}

class PostErrorState extends PostState {
  PostErrorState(this.error);
  final String error;
}
