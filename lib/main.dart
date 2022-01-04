import 'package:bloc_travel_app/cubit/app_cubit_logic.dart';
import 'package:bloc_travel_app/cubit/app_cubits.dart';
import 'package:bloc_travel_app/pages/detail_page.dart';
import 'package:bloc_travel_app/pages/navpages/main_page.dart';
import 'package:bloc_travel_app/pages/welcome_page.dart';
import 'package:bloc_travel_app/services/data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(

        create: (context) => AppCubits(dataServices: DataServices()),
        child: AppCubitLogics(),
      ),
    );
  }
}
