import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_bloc/data/entities/post.dart';
import 'package:users_app_bloc/data/entities/users.dart';
import 'package:users_app_bloc/repository/users/users_repository_impl.dart';
import 'package:users_app_bloc/ui/blocs/post_bloc/post_bloc.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.user});
  final Users user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
            ),
            const Text(
              'Datos Personales',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text('Nombre:  ${user.name}'),
            Text('Telefono:  ${user.phone}'),
            SizedBox(
              height: 10,
            ),
            const Text(
              'Datos en Linea',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text('Email: ${user.email}'),
            Text('Username: ${user.userName}'),
            Text('Website: ${user.website}'),
            SizedBox(
              height: 10,
            ),
            const Text(
              'Datos de direccion',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text('Ciudad: ${user.address.city}'),
            Text('Calle: ${user.address.street}'),
            Text('ZipCode: ${user.address.zipcode}')
          ],
        ),
      ),
    );
  }
}



/*       appBar: AppBar(
        title: Text('Detalle'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, PostState state) {
          if (state is PostsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PostsLoadedState) {
            List<Post> usersList = state.posts;
            return ListView.builder(
                itemCount: usersList.length,
                itemBuilder: (context, index) {
                  final user = usersList[index];
                  child:
                  ListTile(title: Text(user.title), subtitle: Text(user.body));
                });
          }
          if (state is PostErrorState) {
            return const Center(
              child: Text('Error de usuarios'),
            );
          }
          return Container();
        },
      ),
 */
