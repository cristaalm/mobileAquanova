
// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:mobileaquanova/assets/resources/colors.dart';
import 'package:mobileaquanova/option/option.dart';
import 'package:fl_chart/fl_chart.dart';

class GraphComponent extends StatelessWidget {
  final Option option;
  final List<Map<String, dynamic>> historicalData;

  const GraphComponent({
    super.key,
    required this.option,
    required this.historicalData,
  });

  // Generate chart data from historical data
  List<FlSpot> get chartData {
    if (historicalData.isEmpty) {
      return [
        FlSpot(0, 20.5),
        FlSpot(1, 22.1),
        FlSpot(2, 21.7),
        FlSpot(3, 23.2),
        FlSpot(4, 24.5),
        FlSpot(5, 22.8),
        FlSpot(6, 25.0),
      ];
    }

    // Use last 24 entries or less if not available
    final dataToUse =
        historicalData.length > 24
            ? historicalData.sublist(historicalData.length - 24)
            : historicalData;

    return List.generate(dataToUse.length, (index) {
      return FlSpot(
        index.toDouble(),
        double.tryParse(dataToUse[index]['value']) ?? 0.0,
      );
    });
  }

  // Get X-axis labels from timestamps
  List<String> get timeLabels {
    if (historicalData.isEmpty) {
      return ['00:00', '01:00', '02:00', '03:00', '04:00', '05:00', '06:00'];
    }

    final dataToUse =
        historicalData.length > 24
            ? historicalData.sublist(historicalData.length - 24)
            : historicalData;

    return dataToUse.map((entry) {
      final timestamp = entry['timestamp'] as String;
      // Extract just the time portion (assuming format is "dd/MM/yyyy HH:mm")
      final parts = timestamp.split(' ');
      return parts.length > 1 ? parts[1] : '00:00';
    }).toList();
  }

  // Find min and max values for Y-axis scaling
  double get minYValue {
    if (historicalData.isEmpty) return 0.0;

    double min = double.infinity;
    for (var entry in historicalData) {
      final value = double.tryParse(entry['value']) ?? 0.0;
      if (value < min) min = value;
    }
    return (min - 5).clamp(0.0, double.infinity); // Add some padding
  }

  double get maxYValue {
    if (historicalData.isEmpty) return 50.0;

    double max = double.negativeInfinity;
    for (var entry in historicalData) {
      final value = double.tryParse(entry['value']) ?? 0.0;
      if (value > max) max = value;
    }
    return max + 5; // Add some padding
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (option.iconValue.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: ColorsAquanova.backgroundLight,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Image.asset(
                          option.iconValue,
                          width: 18,
                          height: 18,
                          color: ColorsAquanova.darkLetters,
                        ),
                      ),
                    Text(
                      option.graphText,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: ColorsAquanova.darkLetters,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Chart area
            Expanded(child: _buildChart()),
          ],
        ),
      ),
    );
  }

  // Chart widget with historical data
  Widget _buildChart() {
    // Get the actual data for chart
    final spots = chartData;
    final labels = timeLabels;
    final minY = minYValue;
    final maxY = maxYValue;

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              horizontalInterval: 20,  
              verticalInterval: 1,
              getDrawingHorizontalLine: (value) {
                return FlLine(strokeWidth: 1, color: ColorsAquanova.lightGrey);
              },
              getDrawingVerticalLine: (value) {
                return FlLine(strokeWidth: 1, color: ColorsAquanova.lightGrey);
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    const style = TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    );

                    // Only show every 2nd or 3rd label to avoid overcrowding
                    final index = value.toInt();
                    if (index < 0 || index >= labels.length || index % 3 != 0) {
                      return const SizedBox.shrink();
                    }

                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: Text(labels[index], style: style),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 35,
                  getTitlesWidget: (value, meta) {
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: Text(
                        '${value.toInt()}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    );
                  },
                ),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: ColorsAquanova.lightGrey),
            ),
            minX: 0,
            maxX: spots.length.toDouble() - 1,
            minY: minY,
            maxY: maxY,
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                color: option.color,
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: true,
                  getDotPainter:
                      (spot, percent, barData, index) => FlDotCirclePainter(
                        radius: 4,
                        color: option.color,
                        strokeWidth: 2,
                        strokeColor: Colors.white,
                      ),
                ),
                belowBarData: BarAreaData(
                  show: true,
                  color: option.color.withOpacity(0.2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}