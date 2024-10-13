
// // // دالة لإنشاء زر الـ PopupMenu
// //   import 'package:flutter/material.dart';

// // Widget buildPopupMenuButton( BuildContext context, bool isDarkMode, Function(bool) onThemeChanged) {
// //     return PopupMenuButton<int>(
// //       icon: const Icon(Icons.more_vert, color: Colors.white),
// //       onSelected: (value) {
// //         handleMenuSelection(context, value);
// //       },
// //       itemBuilder: (context) => buildPopupMenuItems(isDarkMode, onThemeChanged),
// //     );
// //   }

// // // دالة للتعامل مع تحديد عنصر من القائمة
// //   void handleMenuSelection(BuildContext context, int value) {
// //     switch (value) {
// //       case 1:
// //         shareApp();
// //         break;
// //       case 2:
// //         addProperty();
// //         break;
// //       case 3:
// //         showPaidAd();
// //         break;
// //       case 4:
// //         showSettings();
// //         break;
// //       case 5:
// //         showHelpAndSupport();
// //         break;
// //     }
// //   }

// // // دالة لبناء عناصر القائمة
// //   List<PopupMenuEntry<int>> buildPopupMenuItems(
// //       bool isDarkMode, Function(bool) onThemeChanged) {
// //     return [
// //       const PopupMenuItem(
// //         value: 1,
// //         child: ListTile(
// //           title: Text('مشاركة التطبيق', textAlign: TextAlign.right),
// //           trailing: Icon(Icons.share),
// //         ),
// //       ),
// //       const PopupMenuItem(
// //         value: 2,
// //         child: ListTile(
// //           title: Text('اضافة عقار', textAlign: TextAlign.right),
// //           trailing: Icon(Icons.add_location_alt),
// //         ),
// //       ),
// //       const PopupMenuItem(
// //         value: 3,
// //         child: ListTile(
// //           title: Text('اعلان مدفوع', textAlign: TextAlign.right),
// //           trailing: Icon(Icons.monetization_on),
// //         ),
// //       ),
// //        PopupMenuItem(
// //         value: 4,
// //         child: ListTile(
// //           title: Text('الإعدادات', textAlign: TextAlign.right),
// //           trailing: Icon(Icons.settings),
// //         ),
// //       ),
// //       PopupMenuItem(
// //         value: 4,
// //         child: ListTile(
// //           title: const Text('المظهر', textAlign: TextAlign.right),
// //           trailing: Row(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               Switch(
// //                 value: isDarkMode,
// //                 onChanged: onThemeChanged,
// //               ),
// //               const Icon(Icons.brightness_6),
// //             ],
// //           ),
// //         ),
// //       ),
// //       const PopupMenuItem(
// //         value: 5,
// //         child: ListTile(
// //           title: Text('مساعدة ودعم', textAlign: TextAlign.right),
// //           trailing: Icon(Icons.help),
// //         ),
// //       ),
// //     ];
// //   }




// // // دوال فارغة يمكنك تخصيصها حسب الحاجة
// //   void shareApp() {
// //     // منطق مشاركة التطبيق
// //   }

// //   void addProperty() {
// //     // منطق إضافة عقار
// //   }

// //   void showPaidAd() {
// //     // منطق عرض إعلان مدفوع
// //   }

// //   void showSettings() {
// //     // منطق عرض الإعدادات
// //   }

// //   void showHelpAndSupport() {
// //     // منطق عرض المساعدة والدعم
// //   }
// import 'package:flutter/material.dart';
// import '../../view/screen/profileusers/aboutus.dart';
// import '../../view/screen/profileusers/settings.dart';
// import '../../view/screen/profileusers/support.dart';
// // دالة لإنشاء زر الـ PopupMenu
// Widget buildPopupMenuButton(BuildContext context, bool isDarkMode, Function(bool) onThemeChanged) {
//   return PopupMenuButton<int>(
//     icon: const Icon(Icons.more_vert, color: Colors.white),
//     onSelected: (value) {
//       handleMenuSelection(context, value);
//     },
//     itemBuilder: (context) => buildPopupMenuItems(isDarkMode, onThemeChanged),
//   );
// }

// // دالة للتعامل مع تحديد عنصر من القائمة
// void handleMenuSelection(BuildContext context, int value) {
//   switch (value) {
//     case 1:
//       shareApp();
//       break;
//     case 2:
//       addProperty();
//       break;
//     case 3:
//       showPaidAd();
//       break;
//     case 4:
//       Navigator.of(context).push(
//         MaterialPageRoute(builder: (context) =>  SettingsPage()), // التأكد من استيراد صفحة الإعدادات
//       );
//       break;
//     case 5:
//       Navigator.of(context).push(
//         MaterialPageRoute(builder: (context) =>  SupportPage()), // التأكد من استيراد صفحة المساعدة
//       );
//       break;
//   }
// }

// // دالة لبناء عناصر القائمة
// List<PopupMenuEntry<int>> buildPopupMenuItems(bool isDarkMode, Function(bool) onThemeChanged) {
//   return [
//     _buildPopupMenuItem(1, 'مشاركة التطبيق', Icons.share),
//     _buildPopupMenuItem(2, 'اضافة عقار', Icons.add_location_alt),
//     _buildPopupMenuItem(3, 'اعلان مدفوع', Icons.monetization_on),
//     _buildPopupMenuItem(4, 'الإعدادات', Icons.settings),
//     _buildPopupMenuItem(5, 'مساعدة ودعم', Icons.help),
//     _buildAppearanceMenuItem(isDarkMode, onThemeChanged),
//   ];
// }

// // دالة لإنشاء عنصر القائمة
// PopupMenuItem<int> _buildPopupMenuItem(int value, String title, IconData icon) {
//   return PopupMenuItem<int>(
//     value: value,
//     child: Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.0),
//         color: Colors.grey[200], // لون الخلفية
//       ),
//       child: ListTile(
//         title: Text(title, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold)),
//         trailing: Icon(icon, color: Colors.black),
//       ),
//     ),
//   );
// }

// // دالة لإنشاء عنصر المظهر
// PopupMenuItem<int> _buildAppearanceMenuItem(bool isDarkMode, Function(bool) onThemeChanged) {
//   return PopupMenuItem<int>(
//     value: 6,
//     child: Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.0),
//         color: Colors.grey[200], // لون الخلفية
//       ),
//       child: ListTile(
//         title: const Text('المظهر', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold)),
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Switch(
//               value: isDarkMode,
//               onChanged: onThemeChanged,
//             ),
//             const Icon(Icons.brightness_6),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// // دوال فارغة يمكنك تخصيصها حسب الحاجة
// void shareApp() {
//   // منطق مشاركة التطبيق
// }

// void addProperty() {
//   // منطق إضافة عقار
// }

// void showPaidAd() {
//   // منطق عرض إعلان مدفوع
// }
// دالة لإنشاء زر الـ PopupMenu
import 'package:application_aqars/view/screen/profileusers/settings.dart';
import 'package:application_aqars/view/screen/profileusers/support.dart';
import 'package:application_aqars/view/screen/requests/requestPages.dart';
import 'package:application_aqars/view/screen/share_page.dart';
import 'package:flutter/material.dart';

Widget buildPopupMenuButton(
    BuildContext context, bool isDarkMode, Function(bool) onThemeChanged) {
  return PopupMenuButton<int>(
    icon: const Icon(Icons.more_vert, color: Colors.white),
    onSelected: (value) {
      handleMenuSelection(context, value);
    },
    itemBuilder: (context) => buildPopupMenuItems(isDarkMode, onThemeChanged),
  );
}

void handleMenuSelection(BuildContext context, int value) {
  switch (value) {
    case 1:
      // مشاركة التطبيق - يمكن أن تحتاج لتنفيذ عملية مشاركة هنا
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SharePage()),
      );
      break;
    case 2:
      // رفع طلب
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Requestpages()),
      );
      break;
    case 3:
      // الإعدادات
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsPage()),
      );
      break;
    case 4:
      // المظهر - هنا لا تحتاج التنقل ولكن فقط تبديل الثيم
      break;
    case 5:
      // مساعدة ودعم
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SupportPage()),
      );
      break;
  }
}

// دالة لبناء عناصر القائمة
List<PopupMenuEntry<int>> buildPopupMenuItems(
    bool isDarkMode, Function(bool) onThemeChanged) {
  return [
    const PopupMenuItem(
      value: 1,
      child: ListTile(
        title: Text('مشاركة التطبيق', textAlign: TextAlign.right),
        trailing: Icon(Icons.share),
      ),
    ),
    const PopupMenuItem(
      value: 2,
      child: ListTile(
        title: Text('رفع طلب', textAlign: TextAlign.right),
        trailing: Icon(Icons.add_location_alt),
      ),
    ),
    const PopupMenuItem(
      value: 3,
      child: ListTile(
        title: Text('الإعدادات', textAlign: TextAlign.right),
        trailing: Icon(Icons.settings),
      ),
    ),
    PopupMenuItem(
      value: 4,
      child: ListTile(
        title: const Text('المظهر', textAlign: TextAlign.right),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Switch(
              value: isDarkMode,
              onChanged: onThemeChanged,
            ),
            const Icon(Icons.brightness_6),
          ],
        ),
      ),
    ),
    const PopupMenuItem(
      value: 5,
      child: ListTile(
        title: Text('مساعدة ودعم', textAlign: TextAlign.right),
        trailing: Icon(Icons.help),
      ),
    ),
  ];
}