import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('TODO'),
              backgroundColor: Color(0xff64b5f6),
              centerTitle: true,
            ),
            body: Stack(
              children: [
                Center(
                  child: Text('할 일을 입력해주세요.', style: TextStyle(color: Color(0xff959595)),),
                ),
              ],
            ),
                floatingActionButton: FloatingActionButton(onPressed: () {}, child: Icon(Icons.add, color: Colors.white,), backgroundColor: Color(0xdd000000),),
            ));
  }
}