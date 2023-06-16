import 'package:flutter/material.dart';

class Guardian extends StatelessWidget {
  const Guardian({Key? key}) : super(key: key);

  Map<String, String> getGuardianInfo() {
    return {
      'Role': 'Sister',
      'First Name': 'Martha',
      'Last Name': 'Shan',
      'Address': '1357 Amber Drive, Beaverton, OR 97006',
      'Telephone': '816-276-6909',
    };
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> guardianInfo = getGuardianInfo();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Guardian'),
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
                for (var entry in guardianInfo.entries)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledText(entry.key, fontWeight: FontWeight.bold),
                      StyledText(entry.value, fontSize: 18),
                      const SizedBox(height: 15),
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
