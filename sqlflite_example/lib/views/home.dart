import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO', style: TextStyle(fontSize: 30),),
        backgroundColor: Color(0xff64b5f6),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Text(
              '할 일을 입력해주세요',
              style: TextStyle(fontSize: 20, color: Color(0xff959595)),
          ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => context.go('/RegisterTodo'),
        backgroundColor: Color(0xff64b5f6),
        child: Icon(Icons.add, color: Colors.white),),
    );
  }


}