import 'package:users_app_bloc/data/entities/post.dart';
import 'package:users_app_bloc/data/entities/users.dart';

abstract class UsersRepository {
  Future<List<Users>> getUsers();
  Future<List<Post>> getPosts(int id);
}
