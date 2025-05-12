import 'package:flutter/material.dart';
import 'package:mobileaquanova/Modules/base_module.dart';
import 'package:mobileaquanova/option/option.dart';
import 'package:mobileaquanova/Modules/Ambient/ambient_temp_data.dart';
import 'package:mobileaquanova/Modules/Ambient/ambient_hum_data.dart';

class AmbientTempModule extends StatefulWidget {
  final Option option;

  const AmbientTempModule({
    super.key,
    required this.option,
  });

  @override
  State<AmbientTempModule> createState() => _AmbientTempModuleState();
}

class _AmbientTempModuleState extends State<AmbientTempModule> {
  @override
  Widget build(BuildContext context) {
    final option = AmbientTempData.getOption();
    final historicalData = AmbientTempData.getSampleHistoricalData();
    
    return BaseModule(
      option: option,
      historicalData: historicalData,
    );
  }
}

class AmbientHumModule extends StatefulWidget {
  final Option option;

  const AmbientHumModule({
    super.key,
    required this.option,
  });

  @override
  State<AmbientHumModule> createState() => _AmbientHumModuleState();
}

class _AmbientHumModuleState extends State<AmbientHumModule> {
  @override
  Widget build(BuildContext context) {
    final option = AmbientHumData.getOption();
    final historicalData = AmbientHumData.getSampleHistoricalData();
    
    return BaseModule(
      option: option,
      historicalData: historicalData,
    );
  }
}