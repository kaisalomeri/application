import 'package:application_aqars/intro/intro_page1.dart';
import 'package:application_aqars/intro/intro_page2.dart';
import 'package:application_aqars/intro/intro_page3.dart';
import 'package:application_aqars/intro/intro_page4.dart';
import 'package:application_aqars/intro/intro_page5.dart';
import 'package:application_aqars/themes/app_theme.dart';
import 'package:application_aqars/auth/createAccount.dart';
import 'package:application_aqars/auth/forgetPassword.dart';
import 'package:application_aqars/auth/login.dart';
import 'package:application_aqars/auth/minstar.dart';
import 'package:application_aqars/auth/typeAuth.dart';
import 'package:application_aqars/auth/resetPassword.dart';
import 'package:application_aqars/auth/vertifiedCode.dart';
import 'package:application_aqars/auth/funrepet.dart';

import 'package:application_aqars/view/screen/details/detailsproprty.dart';
import 'package:application_aqars/view/screen/home.dart';
import 'package:application_aqars/view/widgets/baselayout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system; // Initial theme mode

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Themed App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode, // Apply the theme mode
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      builder: (context, child) =>
          Directionality(textDirection: TextDirection.rtl, child: child!),
      routes: {
        '/': (context) => Splash(),
        '/intro1': (context) => IntroPage1(
              toggleTheme:
                  _toggleTheme, // Pass the toggle function to the IntroPage1
            ),
        '/intro2': (context) => IntroPage2(
              toggleTheme:
                  _toggleTheme, // Pass the toggle function to the IntroPage1
            ),
        '/intro3': (context) => IntroPage3(
              toggleTheme:
                  _toggleTheme, // Pass the toggle function to the IntroPage1
            ),
        '/intro4': (context) => IntroPage4(
              toggleTheme:
                  _toggleTheme, // Pass the toggle function to the IntroPage1
            ),
        '/intro5': (context) => IntroPage5(
              toggleTheme:
                  _toggleTheme, // Pass the toggle function to the IntroPage1
            ),

        // '/login': (context) => Login(),
        // '/typeAuth': (context) => TypeAuth(),
        // '/createAuth': (context) => CreateAccount(),
        // '/providerAuth': (context) => ProviderAuth(),
        // '/forgetAuth': (context) => ForgetPassword(),
        // '/resetAuth': (context) => ResetPassword(),
        // '/verAuth': (context) => VerifiedCode(isResetPassword:false, email: '',),
        //  '/bottomNavigationBar': (context) => BottomNavigationBarWidget(),
        //  '/baselayout':(context)=> BaseLayout(content:MyHomePage(),),
        '/login': (context) => Login(),
        '/typeAuth': (context) => TypeAuth(),
        '/createAccount': (context) => CreateAccount(// تمرير رقم الهاتف
            ),
        '/forgetPassword': (context) => ForgetPassword(),
        '/resetPassword': (context) => ResetPassword(),
        // '/vertifiedCode': (context) => VertifiedCode(),
        '/home': (context) => MyHomePage(),
        '/baselayout': (context) => MainPage(),
        '/detailsproprty': (context) => RealEstateScreen(),
        // '/lands': (context) =>Lands(),
        // '/buildings': (context) =>Buildings(),
        // '/apartments': (context) =>Apartment(),
        // '/settings': (context) => Setting(),
        // '/sharePage': (context) => SharePage(),
        // '/providerLogin': (context) => ProviderLogin(),
        // '/providerCreate1': (context) => CreateProviderAccount1(),
        // '/providerCreate2': (context) => CreateProviderAccount2(),
        // '/providerCreate3': (context) => CreateProviderAccount3(),

        // '/appInfo': (context) => AppInfoPage(),
        // '/privacyPage': (context) => PrivacyPolicyPage(),
        // '/langPage': (context) => LanguagePage(),
        // '/help': (context) => HelpCenterPage(),
        // '/helpPayments': (context) => PaymentPage(),
        // '/helpAds': (context) => AdsPage(),
        // '/helpSecurity': (context) => SecurityPage(),
        // '/helpAccounts': (context) => AccountPage(),
        // '/contactUs': (context) => ContactUsPage(),
        // '/suggest': (context) => SuggestionPage(),
        // '/sharePage': (context) => SharePage(),
        // '/notificationPage': (context) => NotificationsPage(),
        // '/securityInfo': (context) => SecurityPage(),
        // '/changePassword': (context) => ChangePasswordPage(),
        // '/changeEmail': (context) => ChangeEmailPage(),
        // '/deleteAccount': (context) => DeleteAccountPage(),
        // '/logout': (context) => LogoutPage(),
      },
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _toggleTheme() {
    // Implement your theme toggle logic here
    // This is just an example of how you might toggle the theme
    setState(() {
      // Toggle theme logic, e.g., updating a boolean flag or calling a theme provider
    });
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 5), () {
      Navigator.popAndPushNamed(context, '/intro1');
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset(
                'assets/images/logo.png',
                height: 300,
                width: 300,
              ),
            ),
            Text(
              " App Dalal",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
