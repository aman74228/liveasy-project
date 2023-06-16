import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy_app/phone_auth.dart';
import 'package:liveasy_app/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

class LanguageScreen extends StatefulWidget {
  LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final List locale = [
    {'name': 'English', 'locale': Locale('en', 'US')},
    {'name': 'हिंदी', 'locale': Locale('hi', 'IN')},
    {'name': 'français', 'locale': Locale('fr', 'FR')},
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  builddialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text("Choose a language"),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: () {
                          print(locale[index]['name']);
                          updateLanguage(locale[index]['locale']);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/v.png'),
              alignment: Alignment.bottomCenter,
              fit: BoxFit.contain),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 20),
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    "assets/image.avif",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Please select your language".tr,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("You can change the language anytime".tr),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    builddialog(context);
                  },
                  child: Text(
                    'Select Language',
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    ap.isSignedIn ==
                            true //If I set it to false, It'll redirect you to the homescreen so I'll leave it as true for registration.
                        ? Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }))
                        : Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                            return PhoneAuth();
                          }));
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2E3B62),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
