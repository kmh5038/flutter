import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterTodo extends StatelessWidget {
  const RegisterTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          children: [
            Text('123123'),
            Text('123123123'),
            Text('1231231231244')
          ],
        ),
      )
    );
  }
}