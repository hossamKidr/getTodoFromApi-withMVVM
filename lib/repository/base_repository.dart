import 'package:todos_from_api/models/todo_model.dart';

abstract class BaseRepository{
 Future<List<TodoModel>> getAllTodos();
}