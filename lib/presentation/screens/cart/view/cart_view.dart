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
      AppText.pharmacy,
      // appBarAction: AssetsSvg.deliveryIcon,
      appSearchBar: Row(
        children: [
          Expanded(
              child: SearchInput(
            onSearchChanged: onSearchHandler,
          )),
          const SizedBox(
            width: AppSizes.appSideGap * 1.9,
          )
        ],
      ),
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
                TextButton.icon(
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
            // if (state.medicines.isEmpty) {
            //   return Center(child: Text('dshjdsjhdjshdshj'));
            // }
            return SliverPadding(
              padding: const EdgeInsets.only(
                left: AppSizes.appSideGap,
                right: AppSizes.appSideGap * 0.8,
                top: AppSizes.appSideGap,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (ctx, index) {
                    var medicine = state.carts[index];
                    return InkWell(
                      // onTap: () => onMedicineTap(medicine),
                      child: MedicineSearchItem(
                        medicine: medicine,
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
