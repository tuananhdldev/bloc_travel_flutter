import 'package:bloc_travel_app/app_color.dart';
import 'package:bloc_travel_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
class ResponsiveButton extends StatelessWidget {

  bool? isResponsive;
  double? width;

   ResponsiveButton({Key? key, this.width, this.isResponsive = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 50,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isResponsive == true? AppText(text: "Book Trip Now", color:  Colors.white,): Container(),
          Image.asset('assets/images/button-one.png')
        ],
      ),
    );
  }
}
