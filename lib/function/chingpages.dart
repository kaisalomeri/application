import 'package:flutter/material.dart';

// دالة التنقل عند الضغط على أيقونة في BottomNavigationBar
void onItemTapped(BuildContext context, int index) {
  // تحديث الـ currentIndex بناءً على العنصر المختار
  if (index == 0) {
    Navigator.pushReplacementNamed(context, '/baselayout'); // الانتقال إلى الصفحة الرئيسية
  } else if (index == 1) {
    Navigator.pushReplacementNamed(context, '/search'); // الانتقال إلى صفحة البحث
  } else if (index == 2) {
    Navigator.pushReplacementNamed(context, '/ favorite'); // المباني، لا حاجة للتنقل لأننا في صفحة المباني
  } else if (index == 3) {
    Navigator.pushReplacementNamed(context, '/settings'); // الانتقال إلى صفحة الحفظ
  } else if (index == 4) {
    Navigator.pushReplacementNamed(context, '/my_profile_page'); // الانتقال إلى صفحة الحساب
  }
}

// دالة بناء BottomNavigationBar
BottomNavigationBar buildBottomNavigationBar(BuildContext context, int currentIndex) {
  return BottomNavigationBar(
    backgroundColor: const Color(0xFF25346E),
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white.withOpacity(0.5),
    currentIndex: currentIndex,
    type: BottomNavigationBarType.fixed,
    onTap: (index) => onItemTapped(context, index), // استدعاء الدالة عند النقر
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'), // أيقونة الرئيسية بدون نص
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'البحث'), // أيقونة البحث بدون نص
      BottomNavigationBarItem(icon: Icon(Icons.favorite_sharp), label: 'المفضلة'), // أيقونة المفضلة بدون نص
      BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'الحفضـ'), // أيقونة الحفظ بدون نص
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'), // أيقونة الحساب بدون نص
    ],
  );
}