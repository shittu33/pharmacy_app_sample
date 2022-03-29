import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy/app/assets.dart';
import 'package:pharmacy/app/theme.dart';
import 'package:pharmacy/presentation/widgets/common/assets_image.dart';

class PharmacyScaffold extends StatelessWidget {
  const PharmacyScaffold(this.appBarTitle,
      {Key? key,
      this.appSearchBar,
      this.appBarAction,
      this.bodySlivers,
      this.bottomNavBar,
      this.floatingButton,
      this.locationLabel})
      : super(key: key);

  final String appBarTitle;
  final Widget? appBarAction;
  final Widget? appSearchBar;
  final List<Widget>? bodySlivers;
  final Widget? bottomNavBar;
  final Widget? floatingButton;
  final Widget? locationLabel;

  @override
  Widget build(BuildContext context) {
    var expandedHeight =
        MediaQuery.of(context).size.height * AppSizes.appBarExpandedRatio;
    const appBarRadius =
        BorderRadius.vertical(bottom: Radius.circular(AppSizes.appBarRadius));
    return Scaffold(
      floatingActionButton: floatingButton,
      bottomNavigationBar: bottomNavBar,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // toolbarHeight: 200,
            // backgroundColor: AppColors.transparent,
            expandedHeight:
                appSearchBar == null ? expandedHeight * 0.2 : expandedHeight,
            collapsedHeight: appSearchBar == null
                ? expandedHeight * 0.5
                : expandedHeight * 0.9,
            leading: bottomNavBar == null
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back_ios)),
                  )
                : Container(),
            titleSpacing: 24,
            leadingWidth: AppSizes.appSideGap * 1.2,
            title: Text(
              appBarTitle,
              style: Theme.of(context).textTheme.headline1,
            ),
            actions: appBarAction != null
                ? [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: AppSizes.appSideGap),
                      child: appBarAction!,
                    )
                  ]
                : null,
            pinned: true,
            primary: true,
            shape: const RoundedRectangleBorder(borderRadius: appBarRadius),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: appBarRadius,
                    gradient: AppColors.purpleGradient,
                  ),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width *
                            AppSizes.appBarBgGapRatio,
                      ),
                      Expanded(child: AssetsImage.appBarBg)
                    ],
                  )),
              title: appSearchBar ?? Container(),
              titlePadding: const EdgeInsets.symmetric(
                  vertical: AppSizes.appSideGap, horizontal: 21),
              centerTitle: false,
            ),
          ),
          if (locationLabel != null)
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                color: AppColors.backgroundGrey,
                padding: const EdgeInsets.only(left: AppSizes.appSideGap),
                child: locationLabel,
              ),
            ),
          ...?bodySlivers,
        ],
      ),
    );
  }
}
