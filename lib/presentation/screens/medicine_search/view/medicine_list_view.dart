import 'package:flutter/material.dart';

class MedicineListPage extends StatefulWidget {
  const MedicineListPage({Key? key}) : super(key: key);

  @override
  _MedicineListPageState createState() => _MedicineListPageState();
}

class _MedicineListPageState extends State<MedicineListPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar()
      ],)
    );
  }
}
