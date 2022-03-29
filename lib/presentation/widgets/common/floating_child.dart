import 'package:flutter/material.dart';
import 'package:pharmacy/app/theme.dart';
import './assets_icon.dart';


class FloatingActionChild extends StatelessWidget {
  const FloatingActionChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.floatingHeight * 1.1,
      height: AppSizes.floatingHeight * 1.1,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: AppSizes.floatingHeight,
              height: AppSizes.floatingHeight,
              child: AssetsSvg.catIcon,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, gradient: AppColors.redGradient),
            ),
          ),

          /// cart counter
          const Align(
            alignment: FractionalOffset(0.8, 0.0),
            child:  CircleAvatar(
              backgroundColor: AppColors.amber,
              child: Text('2'),
            ),
          )
        ],
      ),
    );
  }
}
