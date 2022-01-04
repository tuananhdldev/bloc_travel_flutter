import 'package:bloc_travel_app/app_color.dart';
import 'package:bloc_travel_app/cubit/app_cubits.dart';
import 'package:bloc_travel_app/widgets/app_large_texts.dart';
import 'package:bloc_travel_app/widgets/app_text.dart';
import 'package:bloc_travel_app/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'assets/images/welcome-one.png',
    'assets/images/welcome-two.png',
    'assets/images/welcome-three.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(images[index]), fit: BoxFit.cover)),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Trips"),
                        AppText(
                          text: 'Mountain',
                          size: 30,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                            width: 250,
                            child: AppText(
                              text:
                                  'Mountain hikes give you an incredible sense of freedom with endurance test',
                              color: Colors.black26,
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: (){
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: Container(
                            width: 200,
                            child: ResponsiveButton(
                              width: 120,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(children: List.generate(images.length, (indexDots) => Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: 8,
                      height: index == indexDots? 25:10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index == indexDots? AppColors.mainColor: AppColors.mainColor.withOpacity(0.5)
                      ),

                    )),)
                  ],
                ),
              ),
            );
          }),
    );
  }
}
