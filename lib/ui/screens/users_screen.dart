import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_bloc/data/entities/users.dart';

import 'package:users_app_bloc/repository/users/users_repository_impl.dart';
import 'package:users_app_bloc/ui/blocs/users_bloc/users_bloc.dart';
import 'package:users_app_bloc/ui/screens/detail_screen.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UsersBloc(RepositoryProvider.of<UsersRepositoryImpl>(context))
            ..add(GetUsersEvent()),
      child: BlocUsersView(),
    );
  }
}

class BlocUsersView extends StatefulWidget {
  const BlocUsersView({
    super.key,
  });

  @override
  State<BlocUsersView> createState() => _BlocUsersViewState();
}

class _BlocUsersViewState extends State<BlocUsersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: context.select((UsersBloc usersBloc) =>
              Text('Usuarios ${usersBloc.state.userCount}'))),
      body: BlocBuilder<UsersBloc, UserState>(
        builder: (context, UserState state) {
          if (state is UserLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UsersLoadedState) {
            List<Users> usersList = state.users;
            return ListView.builder(
                itemCount: usersList.length,
                itemBuilder: (context, index) {
                  final user = usersList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(user: usersList[index])));
                    },
                    child: Dismissible(
                      key: Key(user.id.toString()),
                      onDismissed: (direction) {
                        usersList.removeAt(index);
                        setState(() {});
                      },
                      background: Container(
                        color: Colors.red,
                        child: Icon(Icons.delete),
                        alignment: Alignment.centerRight,
                      ),
                      child: ListTile(
                          title: Text(user.name),
                          subtitle: Text(user.userName)),
                    ),
                  );
                });
          }
          if (state is UsersErrorState) {
            return const Center(
              child: Text('Error de usuarios'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
