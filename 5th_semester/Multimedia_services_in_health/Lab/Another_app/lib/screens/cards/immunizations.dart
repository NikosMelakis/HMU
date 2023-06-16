import 'package:flutter/material.dart';

class Immunizations extends StatelessWidget {
  const Immunizations({Key? key}) : super(key: key);

  List<Map<String, String>> getImmunizations() {
    return [
      {
        'Date': 'May 2001',
        'Immunization Name': 'Influenza virus vaccine, IM',
        'Type': 'Intramuscular injection',
        'Dose Quantity (value / unit)': '50 / mcg',
        'Education/Instructions': 'Possible flu-like symptoms for three days',
      },
      {
        'Date': 'April 2000',
        'Immunization Name': 'Tetanus and diphtheria toxoids, IM',
        'Type': 'Intramuscular injection',
        'Dose Quantity (value / unit)': '50 / mcg',
        'Education/Instructions': 'Mild pain or soreness in the local area',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> immunizations = getImmunizations();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Immunizations'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var immunization in immunizations)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const StyledText('Date:', fontWeight: FontWeight.bold),
                      StyledText(immunization['Date'] ?? '', fontSize: 18),
                      const SizedBox(height: 15),
                      const StyledText('Immunization Name:',
                          fontWeight: FontWeight.bold),
                      StyledText(immunization['Immunization Name'] ?? '',
                          fontSize: 18),
                      const SizedBox(height: 15),
                      const StyledText('Type:', fontWeight: FontWeight.bold),
                      StyledText(immunization['Type'] ?? '', fontSize: 18),
                      const SizedBox(height: 15),
                      const StyledText('Dose Quantity (value / unit):',
                          fontWeight: FontWeight.bold),
                      StyledText(
                          immunization['Dose Quantity (value / unit)'] ?? '',
                          fontSize: 18),
                      const SizedBox(height: 15),
                      const StyledText('Education/Instructions:',
                          fontWeight: FontWeight.bold),
                      StyledText(immunization['Education/Instructions'] ?? '',
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
