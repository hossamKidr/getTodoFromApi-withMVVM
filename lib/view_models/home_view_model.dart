
import 'package:todos_from_api/models/todo_model.dart';
import 'package:todos_from_api/repository/api_todos.dart';
import 'package:todos_from_api/repository/base_repository.dart';

class HomeViewModel {
  String title = 'Todos';
  String error = 'Error';

  BaseRepository? baseRepository;
  HomeViewModel({this.baseRepository});

  Future<List<TodoModel>> fetchAllData() async {
    return ApiTodos().getAllTodos();
  }
}
