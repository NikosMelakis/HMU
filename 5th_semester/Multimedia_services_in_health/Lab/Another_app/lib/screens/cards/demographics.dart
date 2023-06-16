import 'package:flutter/material.dart';

class Demographics extends StatelessWidget {
  const Demographics({Key? key}) : super(key: key);

  Map<String, String> getDemographics() {
    return {
      'First Name': 'Ellen',
      'Last Name': 'Ross',
      'Gender': 'Female',
      'Martial Status': 'Married',
      'Religious Affiliation': 'Christian',
      'Ethnicity': 'Asian',
      'Address': '17 Daws Road, Portland, OR 97006',
      'Telephone': '415-555-1229',
      'Birthday': 'March 7, 1960',
    };
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> demographics = getDemographics();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Demographics'),
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
                for (var entry in demographics.entries)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledText(entry.key, fontWeight: FontWeight.bold),
                      StyledText(entry.value, fontSize: 18),
                      const SizedBox(height: 10),
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
