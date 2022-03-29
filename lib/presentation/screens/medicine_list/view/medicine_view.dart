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

    return PharmacyScaffold(
      AppText.category,
      appBarAction: AssetsSvg.catDotIcon,
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

          ]),
        ),
      ],
    );
  }
}
