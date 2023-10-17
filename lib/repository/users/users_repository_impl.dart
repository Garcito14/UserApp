import 'package:users_app_bloc/data/datasource/users_datasource.dart';
import 'package:users_app_bloc/data/entities/post.dart';
import 'package:users_app_bloc/data/entities/users.dart';
import 'package:users_app_bloc/repository/users/users_repository.dart';

class UsersRepositoryImpl extends UsersRepository {
  final UsersDataSource usersApi = UsersDataSource();
  @override
  Future<List<Users>> getUsers() async {
    try {
      dynamic response = await usersApi.getUsers();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Post>> getPosts(int id) async {
    try {
      dynamic response = await usersApi.getPost(id);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
