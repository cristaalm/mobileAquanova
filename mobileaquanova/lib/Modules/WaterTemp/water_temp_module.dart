import 'package:flutter/material.dart';
import 'package:mobileaquanova/Modules/base_module.dart';
import 'package:mobileaquanova/option.dart';
import 'package:mobileaquanova/Modules/WaterTemp/water_temp_data.dart';

class WaterTempModule extends StatefulWidget {
  final Option option;

  const WaterTempModule({
    super.key,
    required this.option,
  });

  @override
  State<WaterTempModule> createState() => _WaterTempModuleState();
}

class _WaterTempModuleState extends State<WaterTempModule> {
  @override
  Widget build(BuildContext context) {
    final option = WaterTempData.getOption();
    final historicalData = WaterTempData.getSampleHistoricalData();
    
    return BaseModule(
      option: option,
      historicalData: historicalData,
    );
  }
}