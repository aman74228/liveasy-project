import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:liveasy_app/profile_screen.dart';
import 'package:liveasy_app/provider/auth_provider.dart';
import 'package:liveasy_app/utils/utils.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.purple,
              ))
            : Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                  child: Column(
                    children: [
                      Text(
                        "Verify phone",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Code is sent to your phone number"),
                      SizedBox(
                        height: 20,
                      ),
                      Pinput(
                        length: 6,
                        showCursor: true,
                        defaultPinTheme: PinTheme(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xFF93D2F3)),
                              color: Color(0xFF93D2F3),
                            ),
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                        onCompleted: (value) {
                          setState(() {
                            otpCode = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Didn't recieve the code?",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 15,
                            ),
                            children: [
                              TextSpan(
                                  text: " Request again",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}),
                            ]),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (otpCode != null) {
                              verifyOtp(context, otpCode!);
                            } else {
                              showSnackBar(context, "Enter 6-digit code");
                            }
                          },
                          child: Text(
                            "Verify and Continue",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF2E3B62),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

//verify otp
  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
        context: context,
        verificationId: widget.verificationId,
        userOtp: userOtp,
        onSuccess: () {
          //checking whether user exists in the database
          ap.checkExistingUser().then((value) async {
            if (value == true) {
              //user exists in the app
            } else {
              //new user
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                  (route) => false);
            }
          });
        });
  }
}
