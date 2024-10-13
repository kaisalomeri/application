

import 'package:application_aqars/constant/buttons.dart';
import 'package:application_aqars/constant/share/appbar.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'نسيت كلمة المرور',
        backRoute: '/login',
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(8),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 50),
                      Text(
                        'قم بادخال رقمك وبريدك الالكتروني وسيتم ارسال رابط اليك لاستعادة حسابك',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                fontSize: 26, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),

                      Spacer(),

                      // Email Input Field
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFEEEEEE),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(100.0), // Updated radius
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                                right: 10.0), // Added padding
                            child: Icon(Icons.email),
                          ),
                          hintText: "البريد الإلكتروني",
                        ),
                      ),
                      SizedBox(height: 24.0),
                      // Submit Button
                      ElevatedButton(
                        onPressed: () {
                          // Handle button press
                          String email = _emailController.text;
                          print('Email: $email');
                          Navigator.popAndPushNamed(context, '/vertifiedCode');
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(100.0), // Updated radius
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        child: Text('إرسال الرمز'),
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            child: PrivacyPolicyButton(),
                          ),
                        ),
                      ),
                      // Or continue with section at the bottom
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
