import 'package:flutter/material.dart';
import 'package:mobileaquanova/Modules/base_module.dart';
import 'package:mobileaquanova/option/option.dart';
import 'package:mobileaquanova/Modules/WaterLevel/water_level_data.dart'; 

class WaterLevelModule extends StatefulWidget {
  final Option option;

  const WaterLevelModule({
    super.key,
    required this.option,
  });

  @override
  State<WaterLevelModule> createState() => _WaterLevelModuleState();
}

class _WaterLevelModuleState extends State<WaterLevelModule> {
  @override
  Widget build(BuildContext context) {
    final option = WaterLevelData.getOption();
    final historicalData = WaterLevelData.getSampleHistoricalData();
    
    return BaseModule(
      option: option,
      historicalData: historicalData,
    );
  }
}
