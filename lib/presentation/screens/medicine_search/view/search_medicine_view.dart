import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy/app/text.dart';
import 'package:pharmacy/app/routes.dart';
import 'package:pharmacy/app/theme.dart';
import 'package:pharmacy/models/models.dart';
import 'package:pharmacy/presentation/screens/medicine_search/bloc/medicine_search_bloc.dart';
import 'package:pharmacy/presentation/widgets/widget.dart';

class SearchMedicinePage extends StatefulWidget {
  const SearchMedicinePage({Key? key}) : super(key: key);

  @override
  _SearchMedicinePageState createState() => _SearchMedicinePageState();
}

class _SearchMedicinePageState extends State<SearchMedicinePage> {
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
      appBarAction: AssetsSvg.deliveryIcon,
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
      locationLabel: const LocationLabel(),
      floatingButton: const FloatingActionChild(),
      bodySlivers: [
        BlocBuilder<MedicineSearchBloc, MedicineSearchState>(
            builder: (context, state) {
          if (state is MedicineSearchLoading) {
            return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
          if (state is MedicineSearchLoaded) {
            // if (state.medicines.isEmpty) {
            //   return Center(child: Text('dshjdsjhdjshdshj'));
            // }
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
                    return InkWell(
                      onTap: () => onMedicineTap(medicine),
                      child: MedicineSearchItem(
                        medicine: medicine,
                      ),
                    );
                  },
                  childCount: state.medicines.length,
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250.0,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.6,
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
