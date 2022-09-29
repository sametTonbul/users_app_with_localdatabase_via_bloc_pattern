import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_with_realdatabase_firebase/cubit/mainpagecubit.dart';
import 'package:users_app_with_realdatabase_firebase/cubit/usersdetailcubit.dart';
import 'package:users_app_with_realdatabase_firebase/cubit/userssavecubit.dart';
import 'package:users_app_with_realdatabase_firebase/views/mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UsersSaveCubit()),
        BlocProvider(create: (context) => UserDetailCubit()),
        BlocProvider(create: (context) => MainPageCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainPage(),
      ),
    );
  }
}
