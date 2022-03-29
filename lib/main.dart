import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmacy/app/app.dart';
import 'package:pharmacy/repository/medicine_repository.dart';

void main() {
  runApp(MyApp(
    medicineRepository: MedicineRepository(),
  ));
}
