import 'package:todos_from_api/models/todo_model.dart';
import 'package:todos_from_api/repository/base_repository.dart';

class LocalTodos implements BaseRepository{
  @override
  Future<List<TodoModel>> getAllTodos() {
    // TODO: implement getAllTodos
    throw UnimplementedError();
  }

}