import 'package:flutter/material.dart';
import 'package:mvvm_provider_practice/users_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersViewModel userViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
        actions: [
          IconButton(
            onPressed: () async {
              bool userAdded = await userViewModel.addUser();
              if (!userAdded) {
                return;
              }
              Navigator.pop(context);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Name'),
              onChanged: (val) async {
                userViewModel.addingUser!.name = val;
              },
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Email'),
              onChanged: (val) async {
                userViewModel.addingUser!.email = val;
              },
            ),
          ],
        ),
      ),
    );
  }
}
