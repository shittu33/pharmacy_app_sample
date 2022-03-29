import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/app/routes.dart';
import 'package:pharmacy/app/text.dart';
import 'package:pharmacy/app/theme.dart';
import 'package:pharmacy/presentation/screens/medicine_category/medicine_category.dart';
import 'package:pharmacy/presentation/screens/medicine_list/medicine_list.dart';
import 'package:pharmacy/presentation/widgets/widget.dart';

class CategoryFilterPage extends StatefulWidget {
  const CategoryFilterPage({Key? key}) : super(key: key);

  @override
  _CategoryFilterPageState createState() => _CategoryFilterPageState();
}

class _CategoryFilterPageState extends State<CategoryFilterPage> {
  int count = 0;

  // int selectedCategory = 0;

  void viewAllHandler() {
    Navigator.of(context).pushNamed(AppRoutes.medicineCategory);
  }

  void medicineItemHandler() {
    Navigator.of(context).pushNamed(AppRoutes.medicineCategory);
  }

  void categoryItemHandler(int id) {
    selectCategory(id);
  }

  void selectCategory(int id) {
    context.read<CategoryBloc>().add(CategorySelected(id));
    context.read<MedicineBloc>().add(MedicineReloaded(id));
  }

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      var id = ModalRoute.of(context)?.settings.arguments as int;
      selectCategory(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PharmacyScaffold(
      AppText.category,
      appBarAction: AssetsSvg.catDotIcon,
      bodySlivers: [
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            /// Medicine Category Title
            Padding(
              padding: const EdgeInsets.only(
                  left: AppSizes.appSideGap,
                  right: AppSizes.appSideGap,
                  top: AppSizes.appTopGap * 0.5),
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
            BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
              if (state is CategoryLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is CategoryLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 85,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding:
                            const EdgeInsets.only(left: AppSizes.appSideGap),
                        itemBuilder: (ctx, index) {
                          var category = state.categories[index];
                          return InkWell(
                              onTap: () => categoryItemHandler(category.id),
                              child: MedicineCategoryItem(
                                category: category,
                                markSelected: true,
                              ));
                        },
                        itemCount: state.categories.length,
                      ),
                    ),

                    /// Medicine Grid title
                    Padding(
                        padding: const EdgeInsets.only(
                            left: AppSizes.appSideGap, top: AppSizes.appTopGap),
                        child: Text(
                          state.selectedCategory.name.toUpperCase(),
                          style: Theme.of(context).textTheme.headline3,
                        ))
                  ],
                );
              }
              return const Center(child: Text('Something went wrong!'));
            }),
          ]),
        ),

        /// Medicine Grid items
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
