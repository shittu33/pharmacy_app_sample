import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/app/text.dart';
import 'package:pharmacy/app/routes.dart';
import 'package:pharmacy/app/theme.dart';
import 'package:pharmacy/models/models.dart';
import 'package:pharmacy/presentation/screens/cart/cart.dart';
import 'package:pharmacy/presentation/screens/medicine_search/bloc/medicine_search_bloc.dart';
import 'package:pharmacy/presentation/widgets/widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void viewAllHandler() {
    Navigator.of(context).pushNamed(AppRoutes.medicineCategory);
  }

  void categoryItemHandler(int id) {
    Navigator.of(context)
        .pushNamed(AppRoutes.medicineCategoryFilter, arguments: id);
  }

  onSearchHandler(String text) {
    context.read<MedicineSearchBloc>().add(MedicineSearch(text));
  }

  void onMedicineTap(MedicineItem medicine) {
    Navigator.of(context)
        .pushNamed(AppRoutes.medicineView, arguments: medicine);
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    return PharmacyScaffold(
      AppText.cart,
      // appBarAction: AssetsSvg.deliveryIcon,
      floatingButton: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total: ₦1650.00"),
                Text.rich(
                  TextSpan(text: "Total:", children: [
                    TextSpan(text: '# ${context.watch<CartBloc>().medicineRepository.carts}')
                  ]),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: AppColors.darkGray),
                ),
                SizedBox(width: 32,),
                Expanded(
                  child: TextButton.icon(
                    onPressed: (){},
                    icon: AssetsSvg.catIcon,
                    label: Text('CHECKOUT'),
                    style: TextButton.styleFrom(
                        primary: AppColors.white,
                        backgroundColor: AppColors.purple,
                        side: const BorderSide(color: AppColors.purple, width: 1.5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        textStyle: const TextStyle(color: AppColors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bodySlivers: [
        BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
          if (state is CartLoading) {
            return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
          if (state is CartLoaded) {

            return SliverPadding(
              padding: const EdgeInsets.only(
                left: AppSizes.appSideGap,
                right: AppSizes.appSideGap * 0.8,
                top: AppSizes.appSideGap,
              ),
              sliver: SliverList(
                // delegate: SliverChildBuilderDelegate(
                delegate: SliverChildBuilderDelegate(
                  (ctx, index) {
                    var carts = state.carts[index];
                    return InkWell(
                      // onTap: () => onMedicineTap(medicine),
                      child: CartListItem(
                        item: carts,
                      ),
                    );
                  },
                  childCount: state.carts.length,
                ),
              ),
            );
          }
          return const Center(child: Text('Something went wrong!'));
        }),
        // )
      ],
    );
  }
}
