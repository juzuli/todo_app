import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/src/bloc/cubit/todos_repository.dart';
import 'package:to_do_app/src/models/api_response.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosInitial());

  TodosRepository repository = TodosRepository();

  fetchTodos() async {
    try {
      emit(TodosLoading());
      final response = await repository.fetchTodos();
      List<Data>? todos = response.data;
      emit(TodosLoaded(todos));
    } catch (ex) {
      emit(TodosError("Internal server error"));
    }
  }

  Future<bool> addTodos(
      String name, String startTime, String endTime, String date) async {
    ApiResponse apiResponse = await repository.addTodos(
      name,
      startTime,
      endTime,
      date,
    );
    return apiResponse.success ?? false;
  }
}
