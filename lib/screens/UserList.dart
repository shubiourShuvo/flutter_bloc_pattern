import 'package:bloc_practice/user/user_bloc.dart';
import 'package:bloc_practice/user/user_event.dart';
import 'package:bloc_practice/user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user_model.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetAllUserList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Pattern API"),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is UserDataLoaded) {
            return _view(context, state.userModelList);
          } else {
            return const Offstage();
          }
        },
      ),
    );
  }

  Widget _view(BuildContext context, List<UserModel> userModelList) {
    return ListView.builder(
      itemBuilder: (context, itemIndex) {
        UserModel userModel = userModelList[itemIndex];
        return ListTile(
          leading: Text((itemIndex + 1).toString()),
          title: Text(userModel.name.toString()),
          subtitle: Text(userModel.email.toString()),
        );
      },
      itemCount: userModelList.length,
    );
  }
}
