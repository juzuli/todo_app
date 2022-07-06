import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/src/bloc/cubit/todos_cubit.dart';
import 'package:to_do_app/src/constants/strings.dart';
import 'package:to_do_app/src/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCubit(),
      child: MaterialApp(
        title: Strings.todoApp,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: Strings.euclidCircularB,
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
