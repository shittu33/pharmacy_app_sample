import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/app/routes.dart';
import 'package:pharmacy/app/text.dart';
import 'package:pharmacy/app/theme.dart';
import 'package:pharmacy/presentation/screens/medicine_category/medicine_category.dart';
import 'package:pharmacy/presentation/widgets/widget.dart';

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({Key? key}) : super(key: key);

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  void onItemSelected(int id) {
    Navigator.of(context)
        .pushNamed(AppRoutes.medicineCategoryFilter, arguments: id);
  }

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
                  top: AppSizes.appTopGap),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (ctx, index) {
                    var category = state.categories[index];
                    return InkWell(
                      onTap: () => onItemSelected(category.id),
                      child: MedicineCategoryItem(
                        category: category,
                      ),
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
