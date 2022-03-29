
import 'package:flutter/material.dart';
import 'package:pharmacy/app/theme.dart';

class HeartIcon extends StatelessWidget {
  const HeartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.purple.withOpacity(0.3),
      borderRadius: BorderRadius.circular(4),
      child: const Padding(
        padding: EdgeInsets.all(2.0),
        child: Icon(
          Icons.favorite_border,
          color: AppColors.purple,
        ),
      ),
    );
  }
}
