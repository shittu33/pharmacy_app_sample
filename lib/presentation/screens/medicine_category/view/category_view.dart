import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/app/Text.dart';
import 'package:pharmacy/app/theme.dart';
import 'package:pharmacy/presentation/screens/medicine_category/medicine_category.dart';
import 'package:pharmacy/presentation/widgets/widget.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PharmacyScaffold(
      AppText.category,
      appBarAction: AssetsSvg.catDotIcon,
      bodySlivers: [
        /// Medicine Category List
        BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
          if (state is CategoryLoading) {
            return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
          if (state is CategoryLoaded) {
            return SliverPadding(
              padding: const EdgeInsets.only(
                  left: AppSizes.appSideGap,
                  right: AppSizes.appSideGap * 0.5,
                  top: AppSizes.appSideGap),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (ctx, index) {
                    var medicine = state.categories[index];
                    return MedicineCategoryItem(
                      category: medicine,
                    );
                  },
                  childCount: state.categories.length,
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 6,
                  childAspectRatio: 1.5,
                ),
              ),
            );
          }
          return const Center(child: Text('Something went wrong!'));
        }),
      ],
    );
  }
}
