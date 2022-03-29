import 'package:flutter/material.dart';
import 'package:pharmacy/models/models.dart';

class MedicineViewPage extends StatefulWidget {
  const MedicineViewPage({Key? key}) : super(key: key);

  @override
  _MedicineViewPageState createState() => _MedicineViewPageState();
}

class _MedicineViewPageState extends State<MedicineViewPage> {

  @override
  Widget build(BuildContext context) {
    var medicine = ModalRoute.of(context)?.settings.arguments as MedicineItem;

    return Container();
  }
}
