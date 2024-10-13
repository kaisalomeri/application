// // // دالة لبناء زر الإجراء (عشوائي)
// // import 'package:application_aqars/view/screen/my_profile_page.dart';
// // import 'package:application_aqars/view/screen/showproperties/apartments.dart';
// // import 'package:application_aqars/view/screen/showproperties/buildings.dart';
// // import 'package:application_aqars/view/screen/showproperties/lands.dart';
// // import 'package:flutter/material.dart';

// // Widget buildActionButton(String label, bool isSelected) {
// //   return ElevatedButton(
// //     onPressed: () {
// //       // Handle button press
// //     },
// //     style: ElevatedButton.styleFrom(
// //       backgroundColor: isSelected ? const Color(0xFF354B9F) : Colors.white,
// //       foregroundColor: isSelected ? Colors.white : Colors.black,
// //       padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
// //     ),
// //     child: Text(label),
// //   );
// // }

// // // دالة لبناء أزرار التصفية (الإيجار، البيع، الكل) وزر "متابعة"
// // Widget buildFilterButton(String label, bool isSelected) {
// //   return ElevatedButton(
// //     onPressed: () {
// //       // Handle button press
// //     },
// //     style: ElevatedButton.styleFrom(
// //       backgroundColor: isSelected
// //           ? const Color(0xFF354B9F)
// //           : Colors.white, // لون الخلفية يتغير حسب التحديد
// //       foregroundColor: isSelected
// //           ? Colors.white
// //           : Colors.black, // لون النص يتغير حسب التحديد
// //       side: const BorderSide(color: Color(0xFF000000), width: 1), // حدود ثابتة
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(8.0),
// //       ),
// //       padding: const EdgeInsets.symmetric(
// //           horizontal: 26.0, vertical: 12.0), // زيادة المساحة الداخلية
// //     ),
// //     child: Text(label),
// //   );
// // }

// // // دالة لبناء أزرار الفلترة (الإيجار، البيع، الكل)
// // Widget buildFilterButtons() {
// //   return Padding(
// //     padding: const EdgeInsets.symmetric(horizontal: 12.0),
// //     child: Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       children: [
// //         Expanded(child: buildFilterButton('الكل', true)),
// //         const SizedBox(width: 8.0),
// //         Expanded(child: buildFilterButton('الإيجار', false)),
// //         const SizedBox(width: 8.0),
// //         Expanded(child: buildFilterButton('البيع', false)),
// //         IconButton(
// //           icon: const Icon(Icons.filter_list),
// //           onPressed: () {
// //             // Handle filter icon press
// //           },
// //         ),
// //       ],
// //     ),
// //   );
// // }

// // //ازرار  الفلترة ارض
// // Widget buildCategoryBbutton(String label, IconData icon, bool isSelected) {
// //   return Column(
// //     children: [
// //       Container(
// //         width: 73,
// //         height: 71,
// //         decoration: BoxDecoration(
// //           color: isSelected
// //               ? const Color(0xFF354B9F)
// //               : const Color(0xFF000000)
// //                   .withOpacity(0.04), // لون الخلفية يتغير حسب التحديد
// //           borderRadius: BorderRadius.circular(16.0),
// //         ),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Icon(icon,
// //                 color: isSelected
// //                     ? Colors.white
// //                     : Colors.grey), // لون الأيقونة يتغير حسب التحديد
// //             const SizedBox(height: 8.0),
// //             Text(
// //               label,
// //               style: TextStyle(
// //                   color: isSelected
// //                       ? Colors.white
// //                       : Colors.black), // لون النص يتغير حسب التحديد
// //             ),
// //           ],
// //         ),
// //       ),
// //     ],
// //   );
// // }

// //  // دالة لبناء أزرار الإجراءات (عشوائي، متابعة)
// //   Widget buildActionButtons() {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Flexible(child: buildActionButton('عشوائي', true)),
// //           const SizedBox(width: 16.0),
// //           Flexible(child: buildFilterButton('متابعة', false)),
// //         ],
// //       ),
// //     );
// //   }

// // // دالة لبناء أزرار الفئات (أرض، شقة، منزل، مبنى)
// // Widget buildCategoryButtons(BuildContext context) {
// //   return Row(
// //     mainAxisAlignment: MainAxisAlignment.spaceAround,
// //     children: [  buildCategoryButton(context, 'أرض', Icons.landscape, LandsPage()), // هنا تنتقل لصفحة الأراضي
// //                 buildCategoryButton(context, 'شقة', Icons.apartment, ApartmentsPage()), // هنا تنتقل لصفحة الشقق
// //                 buildCategoryButton(context, 'منزل', Icons.home, BuildingsPage()), // هنا تنتقل لصفحة المنازل
// //                  buildCategoryButton(context, 'مبنى', Icons.business,MyProfilePage()), // هنا تنتقل لصفحة المباني
// //     ],
// //   );
// // }

// // // دالة لبناء زر الفئة مع التنقل لصفحات مختلفة
// // Widget buildCategoryButton(
// //     BuildContext context, String label, IconData icon, Widget targetPage) {
// //   return GestureDetector(
// //     onTap: () {
// //       // عند الضغط على الفئة، الانتقال إلى الصفحة المحددة
// //       Navigator.push(context,MaterialPageRoute(builder: (context) => targetPage),
// //       );
// //     },
// //     child: Column(
// //       children: [
// //         Container(
// //           width: 73,
// //           height: 71,
// //           decoration: BoxDecoration(
// //             color: const Color(0xFF000000).withOpacity(0.4),
// //             borderRadius: BorderRadius.circular(16.0),
// //           ),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Icon(icon, color: Colors.white),
// //               const SizedBox(height: 8.0),
// //               Text(label, style: const TextStyle(color: Colors.white)),
// //             ],
// //           ),
// //         ),
// //       ],
// //     ),
// //   );
// // }

// import 'package:flutter/material.dart';
// import 'package:application_aqars/view/screen/my_profile_page.dart';
// import 'package:application_aqars/view/screen/showproperties/apartments.dart';
// import 'package:application_aqars/view/screen/showproperties/buildings.dart';
// import 'package:application_aqars/view/screen/showproperties/lands.dart';

// int selectedIndex = -1; // متغير عالمي لتتبع الفئة المحددة

// // دالة لبناء زر الفئة مع التنقل لصفحات مختلفة
// Widget buildCategoryButton(BuildContext context, String label, IconData icon,
//     Widget targetPage, int index) {
//   bool isSelected = selectedIndex == index;

//   return GestureDetector(
//     onTap: () {
//       selectedIndex = index; // تحديث الفئة المحددة عند الضغط
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => targetPage),
//       );
//     },
//     child: Column(
//       children: [
//         Container(
//           width: 73,
//           height: 71,
//           decoration: BoxDecoration(
//             color: isSelected
//                 ? const Color(0xFF354B9F)
//                 : const Color(0xFF000000).withOpacity(0.04),
//             borderRadius: BorderRadius.circular(16.0),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, color: isSelected ? Colors.white : Colors.grey),
//               const SizedBox(height: 8.0),
//               Text(
//                 label,
//                 style:
//                     TextStyle(color: isSelected ? Colors.white : Colors.black),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

// // دالة لبناء أزرار الفئات (أرض، شقة، منزل، مبنى)
// Widget buildCategoryButtons(BuildContext context) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: [
//       buildCategoryButton(context, 'شقة', Icons.apartment, ApartmentsPage(), 1),
//       buildCategoryButton(context, 'أرض', Icons.landscape, LandsPage(), 0),
//       buildCategoryButton(context, 'مبنى', Icons.business, BuildingsPage(), 3),
//       // buildCategoryButton(context, 'منزل', Icons.home, MyProfilePage(), 2),
//     ],
//   );
// }

// // دالة لبناء زر الإجراء (عشوائي)
// Widget buildActionButton(String label, bool isSelected) {
//   return ElevatedButton(
//     onPressed: () {
//       // تنفيذ الحدث عند الضغط
//     },
//     style: ElevatedButton.styleFrom(
//       backgroundColor: isSelected
//           ? const Color(0xFF354B9F)
//           : Colors.white, // الخلفية تتغير بناءً على التحديد
//       foregroundColor: isSelected
//           ? Colors.white
//           : Colors.black, // النص يتغير بناءً على التحديد
//       padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
//     ),
//     child: Text(label),
//   );
// }

// // دالة لبناء أزرار التصفية (الإيجار، البيع، الكل) وزر "متابعة"
// Widget buildFilterButton(String label, bool isSelected) {
//   return ElevatedButton(
//     onPressed: () {
//       // تنفيذ الحدث عند الضغط
//     },
//     style: ElevatedButton.styleFrom(
//       backgroundColor: isSelected
//           ? const Color(0xFF354B9F)
//           : Colors.white, // لون الخلفية عند التحديد
//       foregroundColor:
//           isSelected ? Colors.white : Colors.black, // لون النص عند التحديد
//       side: const BorderSide(color: Color(0xFF000000), width: 1), // حدود ثابتة
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 12.0),
//     ),
//     child: Text(label),
//   );
// }

// // دالة لبناء أزرار الفلترة (الإيجار، البيع، الكل)
// Widget buildFilterButtons() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 12.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(child: buildFilterButton('الكل', true)),
//         const SizedBox(width: 8.0),
//         Expanded(child: buildFilterButton('الإيجار', false)),
//         const SizedBox(width: 8.0),
//         Expanded(child: buildFilterButton('البيع', false)),
//         IconButton(
//           icon: const Icon(Icons.filter_list),
//           onPressed: () {
//             // تنفيذ الحدث عند الضغط على أيقونة التصفية
//           },
//         ),
//       ],
//     ),
//   );
// }

// // دالة لبناء أزرار الإجراءات (عشوائي، متابعة)
// Widget buildActionButtons() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Flexible(child: buildActionButton('عشوائي', true)),
//         const SizedBox(width: 16.0),
//         Flexible(child: buildActionButton('متابعة', false)),
//       ],
//     ),
//   );
// }
            



            
import 'package:flutter/material.dart';
import 'package:application_aqars/view/screen/showproperties/apartments.dart';
import 'package:application_aqars/view/screen/showproperties/buildings.dart';
import 'package:application_aqars/view/screen/showproperties/lands.dart';

int selectedIndex = -1; // متغير عالمي لتتبع الفئة المحددة

// دالة لبناء زر الفئة مع التنقل لصفحات مختلفة
Widget buildCategoryButton(BuildContext context, String label, IconData icon, Widget targetPage, int index) {
  bool isSelected = selectedIndex == index;

  return GestureDetector(
    onTap: () {
      selectedIndex = index; // تحديث الفئة المحددة عند الضغط
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => targetPage),
      );
    },
    child: Column(
      children: [
        Container(
          width: 73,
          height: 71,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF354B9F) : const Color(0xFF000000).withOpacity(0.04),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: isSelected ? Colors.white : Colors.grey),
              const SizedBox(height: 8.0),
              Text(
                label,
                style: TextStyle(color: isSelected ? Colors.white : Colors.black),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// دالة لبناء أزرار الفئات (أرض، شقة، منزل، مبنى)
Widget buildCategoryButtons(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      buildCategoryButton(context, 'أرض', Icons.landscape, LandsPage(), 0),
      buildCategoryButton(context, 'شقة', Icons.apartment, ApartmentsPage(), 1),
      buildCategoryButton(context, 'منزل', Icons.home, BuildingsPage(), 2),
      buildCategoryButton(context, 'مبنى', Icons.business, BuildingsPage(), 3),
    ],
  );
}
////////////////////////////////////////////////////////////////////////////////////////////











// دالة لبناء أزرار الفلترة (الإيجار، البيع، الكل)
Widget buildFilterButtons() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: buildFilterButton('الكل', true)),
        const SizedBox(width: 8.0),
        Expanded(child: buildFilterButton('الإيجار', false)),
        const SizedBox(width: 8.0),
        Expanded(child: buildFilterButton('البيع', false)),
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () {
            // تنفيذ الحدث عند الضغط على أيقونة التصفية
          },
        ),
      ],
    ),
  );
}

// دالة لبناء أزرار التصفية (الإيجار، البيع، الكل)"
Widget buildFilterButton(String label, bool isSelected) {
  return ElevatedButton(
    onPressed: () {
      // تنفيذ الحدث عند الضغط
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: isSelected ? const Color(0xFF354B9F) : Colors.white, // لون الخلفية عند التحديد
      foregroundColor: isSelected ? Colors.white : Colors.black, // لون النص عند التحديد
      side: const BorderSide(color: Color(0xFF000000), width: 1), // حدود ثابتة
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 12.0),
    ),
    child: Text(label),
  );
}


///////////////////////////////////////////////////////

// دالة لبناء أزرار الإجراءات (عشوائي، )
Widget buildActionButtons() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: buildActionButton('عشوائي', false)),
       
      ],
    ),
  );
}

// دالة لبناء زر الإجراء (عشوائي)
Widget buildActionButton(String label, bool isSelected) {
  return ElevatedButton(
    onPressed: () {
      // تنفيذ الحدث عند الضغط
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: isSelected ? const Color(0xFF354B9F) : Colors.white, // الخلفية تتغير بناءً على التحديد
      foregroundColor: isSelected ? Colors.white : Colors.black, // النص يتغير بناءً على التحديد
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
    ),
    child: Text(label),
  );
}
















 // const SizedBox(width: 16.0),
        // Flexible(child: buildActionButton('متابعة', false)),