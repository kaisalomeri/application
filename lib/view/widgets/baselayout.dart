// import 'package:application_aqars/constant/search.dart';
// import 'package:application_aqars/constant/share/favorite.dart';
// import 'package:application_aqars/view/screen/home.dart';
// import 'package:application_aqars/view/screen/my_profile_page.dart';
// import 'package:application_aqars/view/screen/settings.dart';
// import 'package:flutter/material.dart';

// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int _currentIndex = 0;

//   // قائمة الصفحات
//   // قائمة الصفحات
//   final List<Widget> _pages = [
//     // استبدل هذه الصفحات بأسماء الصفحات الخاصة بك
//     MyHomePage(),
//     Search(),
//     FavoritesPage(),
//     Setting(),
//     MyProfilePage(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _currentIndex = index; // تغيير الصفحة المختارة
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_currentIndex], // عرض الصفحة المختارة
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: const Color(0xFF25346E),
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white.withOpacity(0.5),
//         currentIndex: _currentIndex,
//         type: BottomNavigationBarType.fixed,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index; // تغيير الصفحة الحالية
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'البحث'),
//           BottomNavigationBarItem(
//            icon: Icon(Icons.favorite_sharp), label: 'المفضلة'),
//           BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'الحفظ'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
//         ],
//       ),
//     );
//   }
// }
import 'package:application_aqars/constant/search.dart';
import 'package:application_aqars/constant/share/favorite.dart';
import 'package:application_aqars/view/screen/home.dart';
import 'package:application_aqars/view/screen/my_profile_page.dart';
import 'package:application_aqars/view/screen/settings.dart';
import 'package:dio/dio.dart'; // استيراد Dio لإرسال الطلبات
import 'package:flutter/material.dart';
import '../../servers/server/ApiFvariteadvertment.dart';
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  int userId = 1; // افتراضياً، رقم المستخدم

  // قائمة الصفحات
  final List<Widget> _pages = [
    MyHomePage(),
    Search(),
    FavoritesPage(userId:1),
    Setting(),
    MyProfilePage(),
  ];

  // دالة لإرسال رقم المستخدم عند الضغط على المفضلة
  

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // تغيير الصفحة المختارة
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // عرض الصفحة المختارة
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF25346E),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped, // استدعاء الدالة عند النقر
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'البحث'),
          BottomNavigationBarItem(
           icon: Icon(Icons.favorite_sharp), label: 'المفضلة'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'الحفظ'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
        ],
      ),
    );
  }
}
