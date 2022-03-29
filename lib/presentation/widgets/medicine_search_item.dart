import 'package:flutter/material.dart';
import 'package:pharmacy/app/theme.dart';
import 'package:pharmacy/models/models.dart';
import 'package:pharmacy/presentation/widgets/widget.dart';
import 'common/assets_image.dart';

class MedicineSearchItem extends StatelessWidget {
  const MedicineSearchItem({
    Key? key,
    required this.medicine,
  }) : super(key: key);

  final MedicineItem medicine;

  void addToCartHandler() {

  }
  @override
  Widget build(BuildContext context) {
    var radius = const Radius.circular(AppSizes.categoryCardRadius);

    return SizedBox(
      width: 200,
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.vertical(bottom: radius),
        child: Flex(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          direction: Axis.vertical,
          children: [
            SizedBox(
                width: 160,
                height: 117,
                child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: radius),
                    child: Image.asset(
                      medicine.image,
                      fit: BoxFit.cover,
                    ))),
            const SizedBox(
              height: 13,
            ),
            SizedBox(
                height: 18,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: AppSizes.gridTilePadding),
                  child: Text(medicine.title,
                      style: Theme.of(context).textTheme.subtitle1),
                )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: AppSizes.gridTilePadding),
              child: Text.rich(
                TextSpan(text: medicine.type, children: [
                  const TextSpan(text: '・'),
                  TextSpan(text: medicine.size)
                ]),
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: AppColors.darkGray),
              ),
            )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: AppSizes.gridTilePadding),
                  child: Text(
                    '₦ ${medicine.price}',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: AppColors.black),
                  ),
                ),
                // Text('dsds'),
                const Padding(
                  padding:
                      EdgeInsets.only(right: AppSizes.gridTilePadding),
                  child: HeartIcon(),
                )
              ],
            )),
            const SizedBox(
              height: 6,
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextButton(
                    onPressed: addToCartHandler,
                    style: TextButton.styleFrom(
                        primary: AppColors.purple,
                        backgroundColor: AppColors.white,
                        side: const BorderSide(color: AppColors.purple, width: 1.5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        textStyle: const TextStyle(color: AppColors.purple)),
                    child: Text('ADD TO CART',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: AppColors.purple)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            )
          ],
        ),
      ),
    );
  }
}
