import 'package:flutter/material.dart';
import 'package:pharmacy/app/theme.dart';
import 'package:pharmacy/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/presentation/screens/cart/cart.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    var radius = const Radius.circular(AppSizes.categoryCardRadius);

    void removeHandler(int id) {
      context.read<CartBloc>().add(CartItemRemoved(id));
    }

    return SizedBox(
      width: 160,
      child: Material(
        // elevation: 1,
        // borderRadius: BorderRadius.vertical(bottom: radius),
        child: Flex(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.horizontal,
          children: [
            SizedBox(
                width: 80,
                height: 80,
                child: Image.asset(
                  item.image,
                  fit: BoxFit.cover,
                )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 13,
                    ),
                    SizedBox(
                        height: 18,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: AppSizes.gridTilePadding),
                          child: Text(item.title,
                              style: Theme.of(context).textTheme.subtitle1),
                        )),
                    Expanded(
                        child: Padding(
                      padding:
                          const EdgeInsets.only(left: AppSizes.gridTilePadding),
                      child: Text.rich(
                        TextSpan(text: item.type, children: [
                          const TextSpan(text: '・'),
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
                      padding:
                          const EdgeInsets.only(left: AppSizes.gridTilePadding),
                      child: Text(
                        '₦ ${item.price}',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: AppColors.black),
                      ),
                    )),
                  ],
                ),
              ),
            )),
            Expanded(
              child: TextButton.icon(
                  onPressed: ()=>removeHandler(item.id),
                  icon: const Icon(Icons.delete),
                  label: Text(
                    'Remove',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: AppColors.purple),
                  )),
            ),
          ],
        ),
      ),
    );
  }

}
