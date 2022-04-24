import 'package:flutter/material.dart';
import 'package:mvvm_provider_practice/users_list/models/users_list_model.dart';
import 'package:mvvm_provider_practice/users_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel userViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            _ui(userViewModel),
          ],
        ),
      ),
    );
  }

  _ui(UsersViewModel userViewModel) {
    if (userViewModel.loading) {
      return Container();
    }
    if (userViewModel.userError != null) {
      return Container();
    }
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          UserModel userModel = userViewModel.userListModel[index];
          return Container(
            child: Column(
              children: [
                Text(userModel.name),
                Text(userModel.email),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: userViewModel.userListModel.length,
      ),
    );
  }
}
