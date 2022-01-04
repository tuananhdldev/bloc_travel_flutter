import 'package:bloc_travel_app/cubit/app_cubit_states.dart';
import 'package:bloc_travel_app/cubit/app_cubits.dart';
import 'package:bloc_travel_app/pages/detail_page.dart';
import 'package:bloc_travel_app/pages/home_page.dart';
import 'package:bloc_travel_app/pages/navpages/main_page.dart';
import 'package:bloc_travel_app/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitLogics extends StatelessWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomePage();
          }
          else if(state is LoadingState){
             return Center(child: CircularProgressIndicator(),);
          }
          else if(state is LoadedState ){
           return MainPage();
          }else if(state is DetailState)
            {
              return DetailPage(data: state.place,);
            }

          else {
            return Container();
          }
        },
      ),
    );
  }
}
