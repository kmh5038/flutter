import 'package:go_router/go_router.dart';
import 'package:sqlflite_example/views/home.dart';
import 'package:sqlflite_example/views/register_todo.dart';

final GoRouter myRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => Home()),
  GoRoute(path: '/RegisterTodo', builder: (context, state) => RegisterTodo())
]);