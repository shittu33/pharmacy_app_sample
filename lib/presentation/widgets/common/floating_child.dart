import 'package:flutter/material.dart';
import 'package:pharmacy/app/theme.dart';
import './assets_icon.dart';

class FloatingActionChild extends StatelessWidget {
  const FloatingActionChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.floatingHeight * 1.3,
      height: AppSizes.floatingHeight * 1.1,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: AppSizes.floatingHeight,
              height: AppSizes.floatingHeight,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.redGradient,
                  boxShadow: const [
                    BoxShadow(
                        color: AppColors.floatingBtnShadowColor,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(2, 4))
                  ]),
            ),
          ),

          Center(
            child: AssetsSvg.catIcon,
          ),

          /// cart counter
          const Align(
            alignment: FractionalOffset(0.9, 0.0),
            child: SizedBox(
              width: 22,
              height: 22,
              child: CircleAvatar(
                backgroundColor: AppColors.amber,
                child: Text('2'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
