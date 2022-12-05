import 'package:flutter/material.dart';
import 'package:todos_from_api/models/todo_model.dart';
import 'package:todos_from_api/repository/api_todos.dart';
import 'package:todos_from_api/view_models/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}
HomeViewModel viewModel = HomeViewModel(baseRepository: ApiTodos());
class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(viewModel.title),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<TodoModel>>(
          future: viewModel.fetchAllData(),
          builder: (context,snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(
                color: Colors.teal,
              );
            }else if(snapshot.error != null){
              return Text(viewModel.error);
            }else{
              var todos = snapshot.data;
              return ListView.builder(
                  itemCount:todos!.length ,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text('${todos[index].title}'),
                      leading: Container(
                        alignment: Alignment.center,
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('${todos[index].id}'),
                      ),
                    );
                  }
              );
            }
          },
        ),
      ),
    );
  }
}
