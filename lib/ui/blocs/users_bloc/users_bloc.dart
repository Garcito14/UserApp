import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:users_app_bloc/data/entities/post.dart';
import 'package:users_app_bloc/data/entities/users.dart';
import 'package:users_app_bloc/repository/users/users_repository_impl.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UserState> {
  final UsersRepositoryImpl usersRepository;

  UsersBloc(this.usersRepository) : super(UserState()) {
    on<GetUsersEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await usersRepository.getUsers();

        emit(UsersLoadedState(users));
      } catch (e) {
        emit(UsersErrorState(e.toString()));
      }
    });
  }

  void _onDeletedUser(UserDeleted event, Emitter<UserState> emit) {
    emit(state.copyWith(
      userCount: state.userCount,
    ));
  }
}
