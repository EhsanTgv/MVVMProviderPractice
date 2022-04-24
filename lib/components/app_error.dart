import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String? errorText;
  const AppError({this.errorText});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: null != errorText && errorText!.isNotEmpty,
      child: Container(
        child: Text(
          errorText!,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
