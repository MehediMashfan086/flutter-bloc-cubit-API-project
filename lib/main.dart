import 'package:bloc_api_project/bloc/products_bloc.dart';
import 'package:bloc_api_project/cubit/users_cubit.dart';
import 'package:bloc_api_project/debug/bloc_observer.dart';
import 'package:bloc_api_project/repo/products_repo.dart';
import 'package:bloc_api_project/repo/users_repo.dart';
import 'package:bloc_api_project/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => ProductsRepo(),
      ),
      RepositoryProvider(
        create: (context) => UsersRepo(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc(ProductsRepo()),
        ),
        BlocProvider(
          create: (context) => UsersCubit(UsersRepo()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
