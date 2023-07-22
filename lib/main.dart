import 'package:flutter/material.dart';
import 'package:hello_world/data/repository/user_repository_impl.dart';
import 'package:hello_world/domain/usecase/user_usecase.dart';
import 'package:hello_world/presentation/user/user_view.dart';
import 'package:hello_world/presentation/user/user_view_model.dart';

import 'data/source/source.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.red,
        ),
        useMaterial3: true,
      ),
      home: MyInherited1(
        vm: UserViewModel(UserUseCase(UserRepositoryImpl(Source()))),
        child: const UserView(),
      ),
    );
  }
}

class MyInherited1 extends InheritedWidget {
  MyInherited1({super.key, required this.vm, required super.child});

  UserViewModel vm;

  static MyInherited1 of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInherited1>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
