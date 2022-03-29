import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/app/Text.dart';
import 'package:pharmacy/app/routes.dart';
import 'package:pharmacy/app/theme.dart';
import 'package:pharmacy/presentation/screens/medicine_category/medicine_category.dart';
import 'package:pharmacy/presentation/screens/medicine_list/medicine_list.dart';
import 'package:pharmacy/presentation/widgets/widget.dart';

class MedicineListPage extends StatefulWidget {
  const MedicineListPage({Key? key}) : super(key: key);

  @override
  _MedicineListPageState createState() => _MedicineListPageState();
}

class _MedicineListPageState extends State<MedicineListPage> {
  int count = 0;

  void viewAllHandler() {
    Navigator.of(context).pushNamed(AppRoutes.medicineCategory);
  }

  @override
  Widget build(BuildContext context) {
    return PharmacyScaffold(
      AppText.pharmacy,
      appBarAction: AssetsSvg.deliveryIcon,
      appSearchBar: const SearchInput(),
      locationLabel: const LocationLabel(),
      bottomNavBar: BottomNavigationBar(
        onTap: (index) {},
        currentIndex: 2,
        items: [
          BottomNavigationBarItem(
            icon: AssetsSvg.homeIcon(),
            activeIcon: AssetsSvg.homeIcon(color: AppColors.purple),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: AssetsSvg.doctorIcon(),
            activeIcon: AssetsSvg.doctorIcon(color: AppColors.purple),
            label: 'Doctors',
          ),
          BottomNavigationBarItem(
              icon: AssetsSvg.pharmacyCartIcon(),
              activeIcon: AssetsSvg.pharmacyCartIcon(color: AppColors.purple),
              label: 'Pharmacy'),
          BottomNavigationBarItem(
            icon: AssetsSvg.communityIcon(),
            activeIcon: AssetsSvg.communityIcon(color: AppColors.purple),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: AssetsSvg.profileIcon(),
            activeIcon: AssetsSvg.profileIcon(color: AppColors.purple),
            label: 'Profile',
          ),
        ],
      ),
      floatingButton: const ExtendedFloatingChild(),
      bodySlivers: [
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            /// Medicine Category Title
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSizes.appSideGap),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'CATEGORIES',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  TextButton(
                    onPressed: viewAllHandler,
                    child: Text(
                      'VIEW ALL',
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: AppColors.purple,
                          ),
                    ),
                  ),
                ],
              ),
            ),

            /// Medicine Category List
            SizedBox(
              // width: double.infinity,
              height: 85,
              child: BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is CategoryLoaded) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: AppSizes.appSideGap),
                    itemBuilder: (ctx, index) {
                      var category = state.categories[index];
                      return MedicineCategoryItem(category: category);
                    },
                    itemCount: state.categories.length,
                  );
                }
                return const Center(child: Text('Something went wrong!'));
              }),
            ),
          ]),
        ),

        /// Medicine Grid title
        SliverPadding(
            padding: const EdgeInsets.only(
                left: AppSizes.appSideGap, top: AppSizes.appTopGap),
            sliver: SliverToBoxAdapter(
              child: Text(
                'SUGGESTIONS',
                style: Theme.of(context).textTheme.headline3,
              ),
            )),

        /// Medicine Grid items
        // SliverPadding(
        //   padding: const EdgeInsets.only(
        //     left: AppSizes.appSideGap,
        //     right: AppSizes.appSideGap * 0.8,
        //     top: AppSizes.appSideGap,
        //   ),
        //   sliver:
        BlocBuilder<MedicineBloc, MedicineState>(builder: (context, state) {
          if (state is MedicineLoading) {
            return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
          if (state is MedicineLoaded) {
            return SliverPadding(
              padding: const EdgeInsets.only(
                left: AppSizes.appSideGap,
                right: AppSizes.appSideGap * 0.8,
                top: AppSizes.appSideGap,
              ),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (ctx, index) {
                    var medicine = state.medicines[index];
                    return MedicineGridItem(
                      medicine: medicine,
                    );
                  },
                  childCount: state.medicines.length,
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7,
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
