// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:convert';

class Allergies extends StatefulWidget {
  const Allergies({Key? key});

  @override
  _AllergiesState createState() => _AllergiesState();
}

class _AllergiesState extends State<Allergies> {
  // JSON string representing the data
  final String jsonString = '''
    {
      "allergies": [
        {
          "allergy_name": "Penicillin",
          "reaction": "Hives",
          "severity": "Moderate to severe"
        },
        {
          "allergy_name": "Codeine",
          "reaction": "Shortness of Breath",
          "severity": "Moderate"
        },
        {
          "allergy_name": "Bee Stings",
          "reaction": "Anaphylactic Shock",
          "severity": "Severe"
        }
      ]
    }
  ''';

  List<Map<String, dynamic>> allergies = [];

  @override
  void initState() {
    super.initState();
    allergies = getAllergiesFromJson();
  }

  List<Map<String, dynamic>> getAllergiesFromJson() {
    final jsonData = json.decode(jsonString);
    final List<dynamic> allergiesJson = jsonData['allergies'];

    return allergiesJson
        .map((allergyJson) => {
              'allergy_name': allergyJson['allergy_name'],
              'reaction': allergyJson['reaction'],
              'severity': allergyJson['severity'],
            })
        .toList();
  }

  void addAllergy(Map<String, dynamic> allergy) {
    setState(() {
      allergies.add(allergy);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Allergies'),
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
                    builder: (context) => AddAllergyForm(addAllergy)),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var allergy in allergies)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const StyledText('Allergy Name:',
                          fontWeight: FontWeight.bold),
                      StyledText(allergy['allergy_name']!, fontSize: 18),
                      const SizedBox(height: 15),
                      const StyledText('Reaction:',
                          fontWeight: FontWeight.bold),
                      StyledText(allergy['reaction']!, fontSize: 18),
                      const SizedBox(height: 15),
                      const StyledText('Severity:',
                          fontWeight: FontWeight.bold),
                      StyledText(allergy['severity']!, fontSize: 18),
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

class AddAllergyForm extends StatefulWidget {
  final Function(Map<String, dynamic> allergy) onAddAllergy;

  const AddAllergyForm(this.onAddAllergy, {Key? key}) : super(key: key);

  @override
  _AddAllergyFormState createState() => _AddAllergyFormState();
}

class _AddAllergyFormState extends State<AddAllergyForm> {
  final _formKey = GlobalKey<FormState>();

  String? _allergyName;
  String? _reaction;
  String? _severity;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // All fields are valid, add the allergy
      final allergy = {
        'allergy_name': _allergyName,
        'reaction': _reaction,
        'severity': _severity,
      };
      widget.onAddAllergy(allergy);

      Navigator.pop(
          context); // Close the form and go back to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Allergy'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Allergy Name',
                  labelStyle: TextStyle(
                    color: Colors.black87,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the allergy name';
                  }
                  return null;
                },
                onChanged: (value) {
                  _allergyName = value;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Reaction',
                  labelStyle: TextStyle(
                    color: Colors.black87,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the reaction';
                  }
                  return null;
                },
                onChanged: (value) {
                  _reaction = value;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Severity',
                  labelStyle: TextStyle(
                    color: Colors.black87,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the severity';
                  }
                  return null;
                },
                onChanged: (value) {
                  _severity = value;
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: _submitForm,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.teal), // Set background color to teal
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white), // Set text color to white
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
