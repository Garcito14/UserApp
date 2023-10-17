import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:users_app_bloc/data/entities/post.dart';
import 'package:users_app_bloc/data/entities/users.dart';
import 'package:users_app_bloc/repository/users/users_repository_impl.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final UsersRepositoryImpl usersRepository;
  final Users user;
  PostBloc(this.usersRepository, this.user) : super(PostInitial()) {
    on<GetPostEvent>((event, emit) async {
      emit(PostsLoadingState());
      try {
        final users = await usersRepository.getPosts(user.id);

        emit(PostsLoadedState(users));
      } catch (e) {
        emit(PostErrorState(e.toString()));
      }
    });
  }
}
