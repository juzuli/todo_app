part of 'todos_cubit.dart';

abstract class TodosState extends Equatable {
  const TodosState();
}

class TodosInitial extends TodosState {
  @override
  List<Object> get props => [];
}

class TodosLoading extends TodosState {
  @override
  List<Object> get props => [];
}

class TodosLoaded extends TodosState {
  var todos;

  TodosLoaded(this.todos);

  @override
  List<Object> get props => [todos];
}

class TodosError extends TodosState {
  final String errorMessage;
  TodosError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
