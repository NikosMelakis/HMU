// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Procedure extends StatefulWidget {
  const Procedure({Key? key}) : super(key: key);

  @override
  State<Procedure> createState() => _ProcedureState();
}

class _ProcedureState extends State<Procedure> {
  List<Map<String, String>> procedures = [
    {
      'Procedure': 'Laparoscopic Chole',
      'Date': '2002-09-28',
      'Provider': 'Dr. Bala Venktaraman',
      'Location': 'Ashby Medical Center',
    },
    {
      'Procedure': 'Cesarian Section',
      'Date': '2002-03-22',
      'Provider': 'Dr. Tiffany Martinez',
      'Location': 'Ashby Medical Center',
    },
  ];

  void addProcedures(Map<String, String> newProcedure) {
    setState(() {
      procedures.add(newProcedure);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Procedure'),
          backgroundColor: Colors.teal,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Info'),
              Tab(text: 'Chart'),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddProceduresForm(addProcedures)),
                );
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var procedure in procedures)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const StyledText('Procedure:',
                              fontWeight: FontWeight.bold),
                          StyledText(procedure['Procedure'] ?? '',
                              fontSize: 18),
                          const SizedBox(height: 15),
                          const StyledText('Date:',
                              fontWeight: FontWeight.bold),
                          StyledText(procedure['Date'] ?? '', fontSize: 18),
                          const SizedBox(height: 15),
                          const StyledText('Provider:',
                              fontWeight: FontWeight.bold),
                          StyledText(procedure['Provider'] ?? '', fontSize: 18),
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
            ChartTab(procedure: procedures),
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
  final List<Map<String, String>> procedure;

  const ChartTab({Key? key, required this.procedure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = procedure
        .map((procedure) => ChartData(
              procedure['Procedure'] ?? '',
              procedure['Date'] != null
                  ? DateTime.parse(procedure['Date']!)
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
                  '${data.procedure}\n${DateFormat('MMMM dd yyyy').format(data.date)}',
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
  ChartData(this.procedure, this.date, this.color);

  final String procedure;
  final DateTime date;
  final Color color;
}

class AddProceduresForm extends StatefulWidget {
  final Function(Map<String, String>) addProblem;

  const AddProceduresForm(this.addProblem, {Key? key}) : super(key: key);

  @override
  _AddProceduresFormState createState() => _AddProceduresFormState();
}

class _AddProceduresFormState extends State<AddProceduresForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> formData = {};
  DateTime? _selectedDate; // Added variable to store the selected date

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.teal, // Set the primary color to teal
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        formData['Date'] = DateFormat('yyyy-MM-dd')
            .format(picked); // Save formatted date string to form data
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.addProblem(formData);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Procedure'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Date field using a TextButton and showDatePicker
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Procedure'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an procedure';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    formData['Procedure'] = value!;
                  },
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    _selectedDate != null
                        ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                        : 'Select Date',
                    style: const TextStyle(color: Colors.teal, fontSize: 18),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Provider'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the provider';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    formData['Provider'] = value!;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Procedure(),
  ));
}
