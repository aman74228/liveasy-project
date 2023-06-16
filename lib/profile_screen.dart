import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

List<String> options = ['Opt 1', "Opt 2"];

class _ProfileScreenState extends State<ProfileScreen> {
  String currentOption = options[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 150),
            child: Column(
              children: [
                Text(
                  "Please select your profile",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                RadioListTile(
                  value: options[0],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                    });
                  },
                  activeColor: Color(0xFF2E3B62),
                  title: Text(
                    "Shipper",
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(width: 2),
                  ),
                  secondary: Icon(Icons.home_outlined),
                ),
                SizedBox(
                  height: 20,
                ),
                RadioListTile(
                  value: options[1],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                    });
                  },
                  activeColor: Color(0xFF2E3B62),
                  title: Text(
                    "Transporter",
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(width: 2),
                  ),
                  secondary: Icon(Icons.directions_car_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
