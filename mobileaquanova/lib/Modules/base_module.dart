// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mobileaquanova/assets/resources/colors.dart';
import 'package:mobileaquanova/option/option.dart';
import 'package:mobileaquanova/Components/current_value_component.dart';
import 'package:mobileaquanova/Components/limits_component.dart';
import 'package:mobileaquanova/Components/graph_component.dart';
import 'package:mobileaquanova/Components/table_component.dart';

class BaseModule extends StatefulWidget {
  final Option option;
  final List<Map<String, dynamic>>? historicalData;

  const BaseModule({super.key, required this.option, this.historicalData});

  @override
  State<BaseModule> createState() => _BaseModuleState();
}

class _BaseModuleState extends State<BaseModule> {
  List<Map<String, dynamic>> get historicalData => widget.historicalData ?? [];

  // Calculate progress based on min and max values
  double _calculateProgress() {
    if (widget.option.minValue.isNotEmpty &&
        widget.option.maxValue.isNotEmpty &&
        widget.option.value.isNotEmpty) {
      try {
        double min = double.parse(widget.option.minValue.replaceAll(',', '.'));
        double max = double.parse(widget.option.maxValue.replaceAll(',', '.'));
        double value = double.parse(widget.option.value.replaceAll(',', '.'));
        double progress = (value - min) / (max - min);
        return progress.clamp(0.0, 1.0);
      } catch (e) {
        return 0.5;
      }
    }
    return 0.5;
  }

  @override
  Widget build(BuildContext context) {
    double progress = _calculateProgress();

    return Scaffold(
      backgroundColor: ColorsAquanova.backgroundLight,
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Image.asset(
                widget.option.iconTitle,
                width: 24,
                height: 24,
                color: ColorsAquanova.darkLetters,
              ),
            ),
            Expanded(
              child: Text(
                widget.option.title.replaceAll('\n', ' '),
                style: TextStyle(
                  color: ColorsAquanova.darkLetters,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        backgroundColor: ColorsAquanova.backgroundMedium,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tarjeta principal con el valor actual
              CurrentValueComponent(option: widget.option),
              const SizedBox(height: 16.0),

              // Sección de límites
              LimitsComponent(
                option: widget.option,
                progress: progress,
              ),
              const SizedBox(height: 16.0),

              // Gráfica
              SizedBox(
                height: 350, // Fixed height for the graph card
                child: GraphComponent(
                  option: widget.option,
                  historicalData: historicalData,
                ),
              ),

              const SizedBox(height: 16.0),

              // Historial (tabla)
              TableComponent(
                option: widget.option,
                historicalData: historicalData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}