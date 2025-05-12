import 'package:mobileaquanova/option/option.dart';
import 'package:mobileaquanova/Modules/WaterLevel/water_level_data.dart';
import 'package:mobileaquanova/modules/ph/ph_data.dart';
import 'package:mobileaquanova/modules/WaterTemp/water_temp_data.dart';
import 'package:mobileaquanova/modules/CE/ce_data.dart';
import 'package:mobileaquanova/modules/Ambient/ambient_temp_data.dart';
import 'package:mobileaquanova/modules/Ambient/ambient_hum_data.dart';

class OptionsFactory {
  static List<Option> getAllOptions() {
    return [
      WaterLevelData.getOption(),
      PhData.getOption(),
      WaterTempData.getOption(),
      CeData.getOption(),
      AmbientTempData.getOption(),
      AmbientHumData.getOption(),
    ];
  }

  static Option? getOptionByRoute(String routeName) {
    try {
      return getAllOptions().firstWhere(
        (option) => option.routeName == routeName,
      );
    } catch (e) {
      return null;
    }
  }
  
  static Option? getOptionByName(String name) {
    final Map<String, Option> moduleMap = {
      'water-level': WaterLevelData.getOption(),
      'ph': PhData.getOption(),
      'water-temp': WaterTempData.getOption(),
      'ce': CeData.getOption(),
      'ambient-temp': AmbientTempData.getOption(),
      'ambient-humidity': AmbientHumData.getOption(),
    };
    return moduleMap[name];
  }
}