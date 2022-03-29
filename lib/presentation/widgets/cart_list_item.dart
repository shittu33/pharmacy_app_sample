import 'package:flutter/material.dart';
import 'package:pharmacy/app/theme.dart';
import 'package:pharmacy/models/models.dart';
import 'common/assets_image.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    var radius = const Radius.circular(AppSizes.categoryCardRadius);

    return SizedBox(
      width: 160,
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.vertical(bottom: radius),
        child: Flex(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          direction: Axis.horizontal,
          children: [
            SizedBox(
                width: 160,
                height: 117,
                child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: radius),
                    child: Image.asset(
                      item.image,
                      fit: BoxFit.cover,
                    ))),
            Expanded(
                child: Row(
              children: [
                const SizedBox(
                  height: 13,
                ),
                SizedBox(
                    height: 18,
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: AppSizes.gridTilePadding),
                      child: Text(item.title,
                          style: Theme.of(context).textTheme.subtitle1),
                    )),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: AppSizes.gridTilePadding),
                      child: Text.rich(
                        TextSpan(text: item.type, children: [
                          TextSpan(text: '・'),
                          TextSpan(text: item.size)
                        ]),
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(color: AppColors.darkGray),
                      ),
                    )),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: AppSizes.gridTilePadding),
                      child: Text(
                        '₦ ${item.price}',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: AppColors.black),
                      ),
                    )),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
