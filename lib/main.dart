import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/src/app.dart';
import 'package:to_do_app/src/bloc/cubit/todos_cubit.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => TodosCubit(),
    child: const MyApp(),
  ));
}
