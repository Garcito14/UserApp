import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:users_app_bloc/data/entities/post.dart';

import 'package:users_app_bloc/data/entities/users.dart';
import 'package:users_app_bloc/data/mappers/user_post_mapper.dart';
import 'package:users_app_bloc/data/mappers/users_mapper.dart';
import 'package:users_app_bloc/data/models/users_post_response.dart';
import 'package:users_app_bloc/data/models/users_reponse.dart';

class UsersDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
  ));

  @override
  Future<List<Users>> getUsers() async {
    try {
      final response = await dio.get('/users');

      if (response.statusCode == 200) {
        final List<dynamic> userResponseList = response.data;

        final List<Users> usersList = userResponseList
            .map((user) => UsersResponse.fromJson(user))
            .map((userResponse) =>
                UsersMapper.userResponseToEntity(userResponse))
            .toList();
        print(usersList.toString());
        return usersList;
      } else {
        throw Exception('Error al cargar usuarios');
      }
    } catch (e) {
      throw Exception('Error en la solicitud HTTP: $e');
    }
  }

  Future<List<Post>> getPost(int id) async {
    try {
      final response = await dio.get('/users/$id/posts');

      if (response.statusCode == 200) {
        final List<dynamic> userPostList = response.data;

        final List<Post> postList = userPostList
            .map((post) => UsersPostDetail.fromJson(post))
            .map((postResponse) =>
                UserPostMapper.postResponseToEntity(postResponse))
            .toList();

        return postList;
      } else {
        throw Exception('Error al cargar usuarios');
      }
    } catch (e) {
      throw Exception('Error en la solicitud HTTP: $e');
    }
  }
}
