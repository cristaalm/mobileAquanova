import 'package:flutter/material.dart';
import 'package:mobileaquanova/Modules/base_module.dart';
import 'package:mobileaquanova/option.dart';
import 'package:mobileaquanova/Modules/CE/ce_data.dart'; 

class CeModule extends StatefulWidget {
  final Option option;

  const CeModule({
    super.key,
    required this.option,
  });

  @override
  State<CeModule> createState() => _CeModuleState();
}

class _CeModuleState extends State<CeModule> {
  @override
  Widget build(BuildContext context) {
    final option = CeData.getOption();
    final historicalData = CeData.getSampleHistoricalData();
    
    return BaseModule(
      option: option,
      historicalData: historicalData,
    );
  }
}