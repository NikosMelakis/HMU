// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, deprecated_member_use

import 'package:exe02/screens/cards/allergies.dart';
import 'package:exe02/screens/cards/demographics.dart';
import 'package:exe02/screens/cards/guardian.dart';
import 'package:exe02/screens/cards/immunizations.dart';
import 'package:exe02/screens/cards/medication.dart';
import 'package:exe02/screens/cards/plan-of-care.dart';
import 'package:exe02/screens/cards/problem-list.dart';
import 'package:exe02/screens/cards/procedure.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/images/hospital.png',
                width: 30,
                height: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'PHR',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.white,
      drawer: const DrawerMenu(), // Add the drawer menu
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 10.0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: const [
                Text(
                  'Welcome Ellen',
                  style: TextStyle(fontSize: 28),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              padding: const EdgeInsets.all(16.0),
              children: [
                CustomCard(
                  title: 'Allergies',
                  image: ('assets/images/allergy.png'),
                  color: Colors.teal,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Allergies()),
                    );
                  },
                ),
                CustomCard(
                  title: 'Immunizations',
                  image: ('assets/images/immune-system.png'),
                  color: Colors.teal,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Immunizations()),
                    );
                  },
                ),
                CustomCard(
                  title: 'Medication',
                  image: ('assets/images/medicine.png'),
                  borderColor: Colors.black38,
                  color: Colors.white38,
                  textColor: Colors.black,
                  assetColor: Colors.black,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Medication()),
                    );
                  },
                ),
                CustomCard(
                  title: 'Problem List',
                  image: ('assets/images/steps.png'),
                  borderColor: Colors.black38,
                  color: Colors.white38,
                  textColor: Colors.black,
                  assetColor: Colors.black,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProblemList()),
                    );
                  },
                ),
                CustomCard(
                  title: 'Procedures',
                  image: ('assets/images/curriculum-vitae.png'),
                  color: Colors.teal,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Procedure()),
                    );
                  },
                ),
                CustomCard(
                  title: 'Guardian',
                  image: ('assets/images/ambulance.png'),
                  color: Colors.teal,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Guardian()),
                    );
                  },
                ),
                CustomCard(
                  title: 'Demographics',
                  image: ('assets/images/iteration.png'),
                  borderColor: Colors.black38,
                  color: Colors.white38,
                  textColor: Colors.black,
                  assetColor: Colors.black,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Demographics()),
                    );
                  },
                ),
                CustomCard(
                  title: 'Plan of Care',
                  image: ('assets/images/health.png'),
                  borderColor: Colors.black38,
                  color: Colors.white38,
                  textColor: Colors.black,
                  assetColor: Colors.black,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlanOfCare()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.title,
    required this.image,
    required this.onPress,
    required this.color,
    this.textColor,
    this.assetColor,
    this.borderColor, // New optional borderColor parameter
  }) : super(key: key);

  final String title;
  final String image;
  final VoidCallback onPress;
  final Color color;
  final Color? textColor;
  final Color? assetColor;
  final Color? borderColor; // New optional borderColor parameter

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Material(
        elevation: 20,
        surfaceTintColor: Colors.black,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: borderColor ??
                  Colors
                      .transparent, // Use provided borderColor or default to transparent
              width: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: 18,
                ),
              ),
              Image.asset(
                image,
                width: 70,
                height: 70,
                color: assetColor ?? Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 123,
            child: DrawerHeader(
              curve: Curves.linear,
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.black87,
                    child: Text('ER'),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Ellen Ross',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/allergy.png',
              width: 24,
              height: 24,
              // Additional properties for customization
              color: Colors.black, // Apply color to the image if needed
              fit: BoxFit.contain, // Adjust the image fit inside the box
            ),
            title: const Text('Allergies'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Allergies()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/immune-system.png',
              width: 24,
              height: 24,
              // Additional properties for customization
              color: Colors.black, // Apply color to the image if needed
              fit: BoxFit.contain, // Adjust the image fit inside the box
            ),
            title: const Text('Immunizations'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Immunizations()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/medicine.png',
              width: 24,
              height: 24,
              // Additional properties for customization
              color: Colors.black, // Apply color to the image if needed
              fit: BoxFit.contain, // Adjust the image fit inside the box
            ),
            title: const Text('Medication'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Medication()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/steps.png',
              width: 24,
              height: 24,
              // Additional properties for customization
              color: Colors.black, // Apply color to the image if needed
              fit: BoxFit.contain, // Adjust the image fit inside the box
            ),
            title: const Text('Problem List'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProblemList()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/curriculum-vitae.png',
              width: 24,
              height: 24,
              // Additional properties for customization
              color: Colors.black, // Apply color to the image if needed
              fit: BoxFit.contain, // Adjust the image fit inside the box
            ),
            title: const Text('Procedures'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Procedure()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/ambulance.png',
              width: 24,
              height: 24,
              // Additional properties for customization
              color: Colors.black, // Apply color to the image if needed
              fit: BoxFit.contain, // Adjust the image fit inside the box
            ),
            title: const Text('Guardian'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Guardian()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/iteration.png',
              width: 24,
              height: 24,
              // Additional properties for customization
              color: Colors.black, // Apply color to the image if needed
              fit: BoxFit.contain, // Adjust the image fit inside the box
            ),
            title: const Text('Demographics'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Demographics()),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/health.png',
              width: 24,
              height: 24,
              // Additional properties for customization
              color: Colors.black, // Apply color to the image if needed
              fit: BoxFit.contain, // Adjust the image fit inside the box
            ),
            title: const Text('Plan of Care'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlanOfCare()),
              );
            },
          ),
        ],
      ),
    );
  }
}
