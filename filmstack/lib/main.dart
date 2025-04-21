import 'package:flutter/material.dart';
import 'package:filmstack/views/screens/home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();  
  await dotenv.load(fileName: ".env");    
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FilmStack',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const HomeScreen()
    );
  }
}

