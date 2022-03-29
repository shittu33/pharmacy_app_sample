import 'package:flutter/material.dart';
import 'package:pharmacy/app/text.dart';
import 'package:pharmacy/app/theme.dart';
import 'package:pharmacy/models/models.dart';
import 'package:pharmacy/presentation/widgets/widget.dart';

class MedicineViewPage extends StatefulWidget {
  const MedicineViewPage({Key? key}) : super(key: key);

  @override
  _MedicineViewPageState createState() => _MedicineViewPageState();
}

class _MedicineViewPageState extends State<MedicineViewPage> {
  @override
  Widget build(BuildContext context) {
    var medicine = ModalRoute.of(context)?.settings.arguments as MedicineItem;

    void addToCartHandler() {

    }

    return PharmacyScaffold(
      AppText.category,
      appBarAction: AssetsSvg.catDotIcon,
      floatingButton: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.8,
            child: TextButton.icon(
              onPressed: addToCartHandler,
              icon: AssetsSvg.catIcon,
              label: Text('Add to cart'),
              style: TextButton.styleFrom(
                  primary: AppColors.white,
                  backgroundColor: AppColors.purple,
                  side: const BorderSide(color: AppColors.purple, width: 1.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  textStyle: const TextStyle(color: AppColors.white)),
            ),
          ),
        ),
      ),
      bodySlivers: [
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            SizedBox(
              height: AppSizes.appTopGap,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.3),
              child: Column(
                children: [
                  Image.asset(
                    medicine.image,
                    width: 170,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 13),
                  Text(medicine.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(color: AppColors.black)),
                  SizedBox(height: 10),
                  Text.rich(
                    TextSpan(text: medicine.type, children: [
                      TextSpan(text: '・'),
                      TextSpan(text: medicine.size)
                    ]),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(color: AppColors.darkGray),
                  ),
                ],
              ),
            ),
            SizedBox(height: 33),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(medicine.image),
              ),
              title: Text(
                'SOLD BY',
                style: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedLabelStyle,
              ),
              subtitle: Text(
                medicine.title,
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: AppColors.middleBlue),
              ),
              trailing: HeartIcon(),
            ),
            SizedBox(height: 15),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSizes.appSideGap),
              child: SizedBox(
                height: 23,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 66,
                      height: 80,
                      child: Material(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 0.1),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('-'),
                              Text(
                                '1',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.copyWith(
                                        color: AppColors.black, fontSize: 15),
                              ),
                              Text('+')
                            ],
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '₦ ${medicine.price}',
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(color: AppColors.black),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppSizes.appTopGap,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSizes.appSideGap),
              child: Text(
                'PRODUCT DETAILS',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: AppColors.middleBlue),
              ),
            )
          ]),
        ),
      ],
    );
  }

}
