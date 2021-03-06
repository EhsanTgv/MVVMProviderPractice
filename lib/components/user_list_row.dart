import 'package:flutter/material.dart';
import 'package:mvvm_provider_practice/users_list/models/users_list_model.dart';

import 'app_title.dart';

class UserListRow extends StatelessWidget {
  final UserModel userModel;
  final Function() onTap;
  const UserListRow({required this.userModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(text: userModel.name!),
          Text(
            userModel.email!,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
