import 'package:bloc_travel_app/app_color.dart';
import 'package:bloc_travel_app/cubit/app_cubit_states.dart';
import 'package:bloc_travel_app/cubit/app_cubits.dart';
import 'package:bloc_travel_app/models/data_model.dart';
import 'package:bloc_travel_app/widgets/app_large_texts.dart';
import 'package:bloc_travel_app/widgets/app_text.dart';
import 'package:bloc_travel_app/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.data}) : super(key: key);
  final  DataModel data;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int goldenStar = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    print(widget.data.name);
    return Scaffold(
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('http://mark.bslmeiyu.com/uploads/'+widget.data.img),
                            fit: BoxFit.cover),
                      ))),
              Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          )),
                    ],
                  )),
              Positioned(
                  top: 310,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: widget.data.name,
                              color: Colors.black54,
                            ),
                            AppLargeText(
                              text: '\$'+ widget.data.price.toString(),
                              color: AppColors.mainColor,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: widget.data.location,
                              color: AppColors.textColor1,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: index < widget.data.stars
                                      ? AppColors.starColor
                                      : Colors.grey,
                                );
                              }),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: widget.data.stars.toString(),
                              color: AppColors.textColor2,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        AppLargeText(
                          text: 'People',
                          size: 20,
                          color: Colors.black54,
                        ),
                        AppText(
                          text: 'Number of people in your group',
                          color: AppColors.mainTextColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: selectedIndex == index
                                        ? Colors.black54
                                        : AppColors.buttonBackground),
                                child: Center(
                                    child: AppText(
                                  text: (index + 1).toString(),
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                )),
                              ),
                            );
                          }),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        AppLargeText(
                          text: 'Description',
                          color: Colors.black.withOpacity(0.8),
                          size: 25,
                        ),
                        AppText(
                          text:
                              'You must go for a travel. Travelling helps get rid of pressure. Go to the mountain to see the nature.',
                          color: AppColors.mainTextColor,
                        ),
                        SizedBox(height: 10,),

                      ],
                    ),
                  )),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all()
                      ),
                      child: Icon(Icons.favorite_border),
                    ),
                     SizedBox(width: 10,),
                     Expanded(child: ResponsiveButton(isResponsive: true,))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
