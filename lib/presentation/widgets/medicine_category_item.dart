import 'package:flutter/material.dart';
import 'package:pharmacy/app/theme.dart';
import 'package:pharmacy/models/models.dart';
import 'common/assets_image.dart';

class MedicineCategoryItem extends StatelessWidget {
  const MedicineCategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryItem category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: const EdgeInsets.only(right: AppSizes.gridTilePadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.categoryCardRadius),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              category.image,
              fit: BoxFit.cover,
            ),
            Container(
              color: AppColors.black.withOpacity(0.65),
            ),
            Center(
              child: Text(
                category.name,
                style: Theme.of(context).textTheme.button,
              ),
            )
          ],
        ),
      ),
    );
  }
}
