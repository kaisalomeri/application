// import 'package:applicationaqars/function/chingpages.dart';
// import 'package:flutter/material.dart';

// class Requestpages extends StatefulWidget {
//   const Requestpages({super.key});

//   @override
//   State<Requestpages> createState() => _RequestpagesState();
// }

// class _RequestpagesState extends State<Requestpages> {
//   int _currentIndex = 2;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color(0xFF354B9F),
//                 Color(0xFF25346E),
//                 Color(0xFF25346E),
//                 Color(0xFF131B39),
//               ],
//             ),
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: () {
//             // Navigate back to the main page (replace with your actual navigation logic)
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text(
//           'رفع طلب',
//           style: TextStyle(color: Colors.white), // White text for the title
//         ),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Center(
//           // Center the content vertically

//           ),
//       bottomNavigationBar: buildBottomNavigationBar(context, _currentIndex),
//     );
//   }
// }

import 'package:application_aqars/function/chingpages.dart';
import 'package:flutter/material.dart';

class Requestpages extends StatefulWidget {
  const Requestpages({super.key});

  @override
  State<Requestpages> createState() => _RequestpagesState();
}

class _RequestpagesState extends State<Requestpages> {
  int _currentIndex = 2;
  String? _selectedRequestType; // نوع الطلب المختار
  final TextEditingController _requestContentController =
      TextEditingController(); // للتحكم في محتوى الطلب

  final List<String> _requestTypes = [
    'شكوى ',
    ' دعم',
    ' عقار'
  ]; // قائمة بأنواع الطلبات

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF354B9F),
                Color(0xFF25346E),
                Color(0xFF25346E),
                Color(0xFF131B39),
              ],
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'رفع طلب',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'اختر نوع الطلب:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              isExpanded: true,
              value: _selectedRequestType,
              hint: const Text('اختر نوع الطلب'),
              items: _requestTypes.map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRequestType = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'محتوى الطلب:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _requestContentController,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'أدخل محتوى الطلب هنا',
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedRequestType != null &&
                      _requestContentController.text.isNotEmpty) {
                    // تنفيذ عملية إرسال الطلب هنا
                    print(
                        'تم إرسال الطلب: نوع - $_selectedRequestType، محتوى - ${_requestContentController.text}');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('يرجى اختيار نوع الطلب وإدخال المحتوى')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  backgroundColor: const Color(0xFF354B9F),
                ),
                child: const Text('إرسال الطلب',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context, _currentIndex),
    );
  }

  @override
  void dispose() {
    _requestContentController
        .dispose(); // التأكد من تنظيف الـ TextField عند التخلص من الصفحة
    super.dispose();
  }
}