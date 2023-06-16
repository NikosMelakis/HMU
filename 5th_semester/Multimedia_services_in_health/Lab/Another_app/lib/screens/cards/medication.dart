// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Medication extends StatefulWidget {
  const Medication({Key? key}) : super(key: key);

  @override
  _MedicationState createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {
  List<Map<String, String>> medications = [
    {
      'Date': '2005-05-28',
      'Type': 'Liquid',
      'Name of Medication': 'Acetaminophen with codeine',
      'Instructions': '2 puffs once a day',
      'Dose Quantity (value / unit)': '2 / puffs',
      'Rate Quantity (value / unit)': '1 / day',
      'Name of Prescriber': 'Ashby Medical Center',
    },
    {
      'Date': '2003-12-10',
      'Type': 'Tablet',
      'Name of Medication': 'Indomethacin',
      'Instructions': '50mg bid with food',
      'Dose Quantity (value / unit)': '50 / mg',
      'Rate Quantity (value / unit)': '2 / day',
      'Name of Prescriber': 'Ashby Medical Center',
    },
  ];

  void addMedication(Map<String, String> newMedication) {
    setState(() {
      medications.add(newMedication);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Medication'),
          backgroundColor: Colors.teal,
          actions: [
            IconButton(
              icon: Stack(
                alignment: Alignment.center,
                children: const [
                  Icon(Icons.add),
                ],
              ),
              iconSize: 30,
              onPressed: () {
                // Navigate to the form screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddMedicationForm(addMedication),
                  ),
                );
              },
            )
          ],
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
                    for (var medication in medications)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const StyledText('Date:',
                              fontWeight: FontWeight.bold),
                          StyledText(medication['Date'] ?? '', fontSize: 18),
                          const SizedBox(height: 15),
                          const StyledText('Type', fontWeight: FontWeight.bold),
                          StyledText(medication['Type'] ?? '', fontSize: 18),
                          const SizedBox(height: 15),
                          const StyledText('Name of Medication',
                              fontWeight: FontWeight.bold),
                          StyledText(medication['Name of Medication'] ?? '',
                              fontSize: 18),
                          const SizedBox(height: 15),
                          const StyledText('Instructions',
                              fontWeight: FontWeight.bold),
                          StyledText(medication['Instructions'] ?? '',
                              fontSize: 18),
                          const SizedBox(height: 15),
                          const StyledText('Dose Quantity (value / unit)',
                              fontWeight: FontWeight.bold),
                          StyledText(
                              medication['Dose Quantity (value / unit)'] ?? '',
                              fontSize: 18),
                          const SizedBox(height: 15),
                          const StyledText('Rate Quantity (value / unit)',
                              fontWeight: FontWeight.bold),
                          StyledText(
                              medication['Rate Quantity (value / unit)'] ?? '',
                              fontSize: 18),
                          const SizedBox(height: 15),
                          const StyledText('Name of Prescriber',
                              fontWeight: FontWeight.bold),
                          StyledText(medication['Name of Prescriber'] ?? '',
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
            ChartTab(medication: medications),
          ],
        ),
      ),
    );
  }
}

class AddMedicationForm extends StatefulWidget {
  final Function(Map<String, String>) addMedication;

  const AddMedicationForm(this.addMedication, {Key? key}) : super(key: key);

  @override
  _AddMedicationFormState createState() => _AddMedicationFormState();
}

class _AddMedicationFormState extends State<AddMedicationForm> {
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
      widget.addMedication(formData);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Medication'),
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
                  decoration: const InputDecoration(labelText: 'Type'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a type';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    formData['Type'] = value!;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Name of Medication'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the name of the medication';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    formData['Name of Medication'] = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Instructions'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the instructions for the medication';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    formData['Instructions'] = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Dose Quantity (value/unit)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the dose quantity for the medication';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    formData['Dose Quantity'] = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Rate Quantity (value/unit)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the rate quantity for the medication';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    formData['Rate Quantity'] = value!;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Name of Prescriber'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the name of prescriber for the medication';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    formData['Name of Prescriber'] = value!;
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
  final List<Map<String, String>> medication;

  const ChartTab({Key? key, required this.medication}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = medication
        .map((medication) => ChartData(
              medication['Name of Medication'] ?? '',
              medication['Date'] != null
                  ? DateTime.parse(medication['Date']!)
                  : DateTime.now(),
              Colors.black,
              medication['Dose Quantity (value / unit)'] ?? '',
              medication['Rate Quantity (value / unit)'] ?? '',
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
                  '${data.medication}\n${data.dose}\n${data.rate}\n${DateFormat('MMMM dd yyyy').format(data.date)}',
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
  ChartData(this.medication, this.date, this.color, this.dose, this.rate);

  final DateTime date;
  final String medication;
  final String dose;
  final String rate;
  final Color color;
}

void main() {
  runApp(const MaterialApp(
    home: Medication(),
  ));
}
