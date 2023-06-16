// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProblemList extends StatefulWidget {
  const ProblemList({Key? key}) : super(key: key);

  @override
  State<ProblemList> createState() => _ProblemListState();
}

class _ProblemListState extends State<ProblemList> {
  List<Map<String, String>> problems = [
    {
      'Observation': 'Ankle Sprain',
      'Status': 'Active',
      'Date': '2005-03-28',
      'Comments': 'Slipped on ice and fell.',
    },
    {
      'Observation': 'Cholecystitis',
      'Status': 'Resolved',
      'Date': '2002-09-28',
      'Comments': 'Surgery postponed until after delivery',
    },
  ];

  void addProblem(Map<String, String> newProblem) {
    setState(() {
      problems.add(newProblem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Problem List'),
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
                    builder: (context) => AddProblemsForm(addProblem),
                  ),
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
                    for (var problem in problems)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const StyledText('Observation:',
                              fontWeight: FontWeight.bold),
                          StyledText(problem['Observation'] ?? '',
                              fontSize: 18),
                          const SizedBox(height: 15),
                          const StyledText('Status:',
                              fontWeight: FontWeight.bold),
                          StyledText(problem['Status'] ?? '', fontSize: 18),
                          const SizedBox(height: 15),
                          const StyledText('Date:',
                              fontWeight: FontWeight.bold),
                          StyledText(problem['Date'] ?? '', fontSize: 18),
                          const SizedBox(height: 15),
                          const StyledText('Comments:',
                              fontWeight: FontWeight.bold),
                          StyledText(problem['Comments'] ?? '', fontSize: 18),
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
            ChartTab(problemList: problems),
          ],
        ),
      ),
    );
  }
}

class AddProblemsForm extends StatefulWidget {
  final Function(Map<String, String>) addProblem;

  const AddProblemsForm(this.addProblem, {Key? key}) : super(key: key);

  @override
  _AddProblemsFormState createState() => _AddProblemsFormState();
}

class _AddProblemsFormState extends State<AddProblemsForm> {
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
        title: const Text('Add Problem'),
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
                  decoration: const InputDecoration(labelText: 'Observation'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an observation';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    formData['Observation'] = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Status'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the status';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    formData['Status'] = value!;
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
                  decoration: const InputDecoration(labelText: 'Comments'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the comments';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    formData['Comments'] = value!;
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
  final List<Map<String, String>> problemList;

  const ChartTab({Key? key, required this.problemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = problemList
        .map((problem) => ChartData(
              problem['Observation'] ?? '',
              problem['Date'] != null
                  ? DateTime.parse(problem['Date']!)
                  : DateTime.now(),
              problem['Status'] == 'Active' ? 1 : 0,
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
                  '${data.observation}\n${DateFormat('MMMM dd yyyy').format(data.date)}',
              yValueMapper: (ChartData data, _) => data.status,
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
  ChartData(this.observation, this.date, this.status, this.color);

  final String observation;
  final DateTime date;
  final int status;
  final Color color;
}
