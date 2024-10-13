
import 'package:application_aqars/view/screen/profileusers/aboutus.dart';
import 'package:application_aqars/view/screen/profileusers/blogus.dart';
import 'package:application_aqars/view/screen/profileusers/callus.dart';
import 'package:application_aqars/view/screen/profileusers/logout.dart';
import 'package:application_aqars/view/screen/profileusers/my_profile_page.dart';
import 'package:application_aqars/view/screen/profileusers/privacy_policy.dart';
import 'package:application_aqars/view/screen/profileusers/support.dart';
import 'package:application_aqars/view/screen/settings.dart';
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
        // '/my_Profile_Page': (context) => MyProfilePage(),
        '/aboutus': (context) => Aboutus(),
        '/callus': (context) => Callus(),
        '/logout': (context) => Logout(),
        '/Privacy_Policy': (context) => PrivacyPolicyPage(),
        '/setting': (context) => Setting(),
        '/support': (context) => SupportPage(),
        '/blogus': (context) => Blogus(),
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
                  MaterialPageRoute(builder: (context) => MyProfilePage()),
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
