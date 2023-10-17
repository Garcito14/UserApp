import 'package:users_app_bloc/data/entities/post.dart';
import 'package:users_app_bloc/data/entities/users.dart';
import 'package:users_app_bloc/data/models/users_post_response.dart';

class UserPostMapper {
  static Post postResponseToEntity(UsersPostDetail userPost) => Post(
      userId: userPost.userId,
      id: userPost.id,
      title: userPost.title,
      body: userPost.body);
}
