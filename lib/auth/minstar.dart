import 'package:application_aqars/auth/createAccount.dart';
import 'package:application_aqars/auth/forgetPassword.dart';
import 'package:application_aqars/auth/login.dart';
import 'package:application_aqars/auth/resetPassword.dart';
import 'package:application_aqars/auth/typeAuth.dart';
import 'package:application_aqars/auth/vertifiedCode.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => Login(),
        '/typeAuth': (context) => TypeAuth(),
        '/forgetPassword': (context) => ForgetPassword(),
        '/resetPassword': (context) => ResetPassword(),
      },
      onGenerateRoute: (settings) {
        // التحقق من المسار المطلوب
        if (settings.name == '/createAccount') {
          final args =
              settings.arguments as Map<String, String>; // استقبال المعاملات
          return MaterialPageRoute(
            builder: (context) {
              return CreateAccount(
              );
            },
          );
        }
        return null; // عدم التعرف على المسار، العودة إلى null
      },
      debugShowCheckedModeBanner: false, // لإزالة شريط الديباج من التطبيق
      title: 'Real Estate App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // الصفحة الرئيسية عند تشغيل التطبيق
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real Estate App'),
        centerTitle: true,
        backgroundColor: Color(0xFF354B9F),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Real Estate App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(FontAwesomeIcons.building, size: 18),
              label: Text('View Apartments'),
              onPressed: () {
                // الانتقال إلى صفحة الشقق عند الضغط
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                backgroundColor: Color(0xFF354B9F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
