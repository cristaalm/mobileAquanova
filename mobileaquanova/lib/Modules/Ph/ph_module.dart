import 'package:flutter/material.dart';
import 'package:mobileaquanova/Modules/base_module.dart';
import 'package:mobileaquanova/option/option.dart';
import 'package:mobileaquanova/Modules/PH/ph_data.dart';
class PhModule extends StatefulWidget {
  final Option option;

  const PhModule({
    super.key,
    required this.option,
  });

  @override
  State<PhModule> createState() => _PhModuleState();
}

class _PhModuleState extends State<PhModule> {
  @override
  Widget build(BuildContext context) {
    final option = PhData.getOption();
    final historicalData = PhData.getSampleHistoricalData();
    
    return BaseModule(
      option: option,
      historicalData: historicalData,
    );
  }
}