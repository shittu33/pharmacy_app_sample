import 'package:flutter/material.dart';
import 'package:pharmacy/app/theme.dart';
import './assets_icon.dart';

class ExtendedFloatingChild extends StatelessWidget {
  const ExtendedFloatingChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: AppSizes.extendedFloatingWidth,
        height: AppSizes.floatingHeight,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
                flex: 5,
                child: FittedBox(
                    child: Text(
                  'Checkout',
                  style: Theme.of(context).textTheme.headline4,
                ))),
            Expanded(flex: 2, child: AssetsSvg.catIcon),
            const Expanded(
              flex: 2,
              child: SizedBox(
                width: 18,
                height: 18,
                child: CircleAvatar(
                  backgroundColor: AppColors.amber,
                  child: Text('2'),
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
                Radius.circular(AppSizes.extendedFloatingRadius)),
            border: Border.all(width: 2, color: AppColors.white),
            gradient: AppColors.redGradient,
            boxShadow: const [
              BoxShadow(
                  color: AppColors.floatingBtnShadowColor,
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(2, 4))
            ]),
      ),
    );
  }
}
