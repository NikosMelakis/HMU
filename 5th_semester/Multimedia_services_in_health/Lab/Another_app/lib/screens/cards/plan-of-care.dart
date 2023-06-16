// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PlanOfCare extends StatelessWidget {
  const PlanOfCare({Key? key}) : super(key: key);

  List<Map<String, String>> getPlanOfCare() {
    return [
      {
        'plannedactivity': 'Office consultation',
        'Planned Date': '2007-05-28',
        'Instructions': 'Consultation with Dr. George Potomac for Asthma',
      },
      {
        'plannedactivity': 'Chest X-Ray',
        'Planned Date': '2007-06-01',
        'Instructions': '',
      },
      {
        'plannedactivity': 'Sputum Culture',
        'Planned Date': '2007-05-28',
        'Instructions': '',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> planofcare = getPlanOfCare();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Plan of Care'),
          backgroundColor: Colors.teal,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Info'),
              Tab(text: 'Chart'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var planofcare in planofcare)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const StyledText('Planned Activity Date:',
                              fontWeight: FontWeight.bold),
                          StyledText(planofcare['plannedactivity'] ?? '',
                              fontSize: 18),
                          const SizedBox(height: 15),
                          const StyledText('Planned Date',
                              fontWeight: FontWeight.bold),
                          StyledText(planofcare['Planned Date'] ?? '',
                              fontSize: 18),
                          const SizedBox(height: 15),
                          const StyledText('Instructions',
                              fontWeight: FontWeight.bold),
                          StyledText(planofcare['Instructions'] ?? '',
                              fontSize: 18),
                          const Divider(
                            height: 50,
                            thickness: 2,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            ChartTab(planofcare: planofcare),
          ],
        ),
      ),
    );
  }
}

class StyledText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const StyledText(
    this.text, {
    Key? key,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: Colors.black,
      ),
    );
  }
}

class ChartTab extends StatelessWidget {
  final List<Map<String, String>> planofcare;

  const ChartTab({Key? key, required this.planofcare}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = planofcare
        .map((planofcare) => ChartData(
              planofcare['plannedactivity'] ?? '',
              planofcare['Planned Date'] != null
                  ? DateTime.parse(planofcare['Planned Date']!)
                  : DateTime.now(),
              Colors.black,
            ))
        .toList();

    return SizedBox(
      height: 300,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 100, left: 20, bottom: 20, right: 20),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(
            isVisible: false,
            minimum: 0,
            maximum: 1.1,
          ),
          plotAreaBorderWidth: 0,
          series: <ChartSeries>[
            ColumnSeries<ChartData, String>(
              isTrackVisible: false,
              width: 0.3,
              opacity: 1.0,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) =>
                  '${data.plannedactivity}\n${DateFormat('MMMM dd yyyy').format(data.date)}',
              yValueMapper: (ChartData data, _) => 1,
              pointColorMapper: (ChartData data, _) => data.color,
              dataLabelSettings: const DataLabelSettings(
                isVisible: false,
                textStyle: TextStyle(color: Colors.black),
                labelAlignment: ChartDataLabelAlignment.outer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.plannedactivity, this.date, this.color);

  final String plannedactivity;
  final DateTime date;
  final Color color;
}

void main() {
  runApp(const MaterialApp(
    home: PlanOfCare(),
  ));
}
