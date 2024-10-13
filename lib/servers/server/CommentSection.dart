// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// class CommentSection extends StatefulWidget {
//   final int advertisementId; // ID الإعلان

//   CommentSection({required this.advertisementId});

//   @override
//   _CommentSectionState createState() => _CommentSectionState();
// }

// class _CommentSectionState extends State<CommentSection> {
//   bool showCommentField = false;
//   bool showRequestField = false;
//   String selectedRequestType = 'تحقق'; // نوع الطلب الافتراضي
//   bool isLoading = false;
//   List<Map<String, dynamic>> requests = []; // قائمة الطلبات

//   final List<String> requestTypes = ['تحقق', 'عرض', 'شراء', 'بيع'];
//   final TextEditingController commentController = TextEditingController();
//   final TextEditingController requestController = TextEditingController();

//   final Dio dio = Dio(); // تهيئة Dio

//   // وظيفة لإرسال التعليق أو الطلب إلى API
//   Future<void> submitForm({required String content, required bool isRequest}) async {
//     setState(() {
//       isLoading = true;
//     });

//     final String url = isRequest
//         ? 'http://127.0.0.1:8000/api/requests' // رابط API الخاص بالطلبات
//         : 'http://127.0.0.1:8000/api/comments'; // رابط API الخاص بالتعليقات

//     final Map<String, dynamic> body = isRequest
//         ? {
//             'advertisement_id': widget.advertisementId.toString(),
//             'request_type': selectedRequestType, // نوع الطلب
//             'description': content,
//             'status': 'pending',
//             'user_id': '1', // يجب تعيين user_id الصحيح
//           }
//         : {
//             'advertisement_id': widget.advertisementId.toString(),
//             'content': content,
//             'user_id': '1', // يجب تعيين user_id الصحيح
//           };

//     try {
//       final response = await dio.post(
//         url,
//         data: body,
//         options: Options(
//           headers: {
//             'Accept': '*/*',
//             'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
//             'Content-Type': 'application/x-www-form-urlencoded',
//           },
//         ),
//       );

//       if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text(isRequest ? 'تم إرسال الطلب بنجاح' : 'تم إرسال التعليق بنجاح'),
//         ));

//         // إضافة الطلبات إلى القائمة إذا كانت الإضافة ناجحة
//         if (isRequest) {
//           setState(() {
//             requests.add({
//               'request_type': selectedRequestType,
//               'description': content,
//               'status': 'pending',
//             });
//           });
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('حدث خطأ في الإرسال: ${response.statusMessage}'),
//         ));
//       }
//     } catch (error) {
//       print('Error: $error');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('حدث خطأ في الاتصال بالإنترنت'),
//       ));
//     } finally {
//       setState(() {
//         isLoading = false;
//         showCommentField = false;
//         showRequestField = false;
//         commentController.clear();
//         requestController.clear();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // زر إضافة تعليق
//             Expanded(
//               child: OutlinedButton.icon(
//                 style: OutlinedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   side: const BorderSide(color: Colors.black),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     showCommentField = true;
//                     showRequestField = false;
//                   });
//                 },
//                 icon: const Icon(Icons.comment, color: Colors.black),
//                 label: const Text(
//                   'إضافة تعليق',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16),

//             // زر تقديم طلب
//             Expanded(
//               child: OutlinedButton.icon(
//                 style: OutlinedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   side: const BorderSide(color: Colors.black),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     showRequestField = true;
//                     showCommentField = false;
//                   });
//                 },
//                 icon: const Icon(Icons.add_task, color: Colors.blue),
//                 label: const Text(
//                   'تقديم طلب',
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 16),

//         // إظهار حقل التعليق عند الضغط على إضافة تعليق
//         if (showCommentField)
//           Row(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: TextFormField(
//                   controller: commentController,
//                   maxLines: 1,
//                   decoration: InputDecoration(
//                     hintText: 'أدخل تعليقك هنا...',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     contentPadding: const EdgeInsets.all(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               ElevatedButton(
//                 onPressed: () {
//                   // استدعاء الوظيفة لتقديم التعليق
//                   submitForm(content: commentController.text, isRequest: false);
//                 },
//                 child: const Text('إرسال'),
//               ),
//             ],
//           ),

//         const SizedBox(height: 16),

//         // إظهار حقل الطلب عند الضغط على تقديم طلب
//         if (showRequestField)
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               DropdownButtonFormField<String>(
//                 value: selectedRequestType,
//                 items: requestTypes
//                     .map((type) => DropdownMenuItem<String>(
//                           value: type,
//                           child: Text(type),
//                         ))
//                     .toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedRequestType = value!;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'اختر نوع الطلب',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: TextFormField(
//                       controller: requestController,
//                       maxLines: 1,
//                       decoration: InputDecoration(
//                         hintText: 'أدخل تفاصيل الطلب هنا...',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         contentPadding: const EdgeInsets.all(10),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   ElevatedButton(
//                     onPressed: () {
//                       // استدعاء الوظيفة لتقديم الطلب
//                       submitForm(content: requestController.text, isRequest: true);
//                     },
//                     child: const Text('إرسال'),
//                   ),
//                 ],
//               ),
//             ],
//           ),

//         const SizedBox(height: 16),

//         // قائمة الطلبات
//         if (requests.isNotEmpty)
//           Container(
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             padding: const EdgeInsets.all(8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text('قائمة الطلبات:', style: TextStyle(fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 8),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: requests.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(requests[index]['request_type']),
//                       subtitle: Text(requests[index]['description']),
//                       trailing: Text(requests[index]['status']),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class CommentSection extends StatefulWidget {
  final int advertisementId; // ID الإعلان

  CommentSection({required this.advertisementId});

  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  bool showCommentField = false;
  bool showRequestField = false;
  String selectedRequestType = 'تحقق'; // نوع الطلب الافتراضي
  bool isLoading = false;
  List<Map<String, dynamic>> requests = []; // قائمة الطلبات

  final List<String> requestTypes = ['تحقق', 'عرض', 'شراء', 'بيع'];
  final TextEditingController commentController = TextEditingController();
  final TextEditingController requestController = TextEditingController();

  final Dio dio = Dio(); // تهيئة Dio

  // وظيفة لإرسال التعليق أو الطلب إلى API
  Future<void> submitForm({required String content, required bool isRequest}) async {
    setState(() {
      isLoading = true;
    });

    final String url = isRequest
        ? 'http://127.0.0.1:8000/api/requests' // رابط API الخاص بالطلبات
        : 'http://127.0.0.1:8000/api/comments'; // رابط API الخاص بالتعليقات

    final Map<String, dynamic> body = isRequest
        ? {
            'advertisement_id': widget.advertisementId.toString(),
            'request_type': selectedRequestType, // نوع الطلب
            'description': content,
            'status': 'pending',
            'user_id': '1', // يجب تعيين user_id الصحيح
          }
        : {
            'advertisement_id': widget.advertisementId.toString(),
            'content': content,
            'user_id': '1', // يجب تعيين user_id الصحيح
          };

    try {
      final response = await dio.post(
        url,
        data: body,
        options: Options(
          headers: {
            'Accept': '*/*',
            'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
      );

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(isRequest ? 'تم إرسال الطلب بنجاح' : 'تم إرسال التعليق بنجاح'),
        ));

        // إضافة الطلبات إلى القائمة إذا كانت الإضافة ناجحة
        if (isRequest) {
          setState(() {
            requests.add({
              'request_type': selectedRequestType,
              'description': content,
              'status': 'pending',
            });
          });
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('حدث خطأ في الإرسال: ${response.statusMessage}'),
        ));
      }
    } catch (error) {
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('حدث خطأ في الاتصال بالإنترنت'),
      ));
    } finally {
      setState(() {
        isLoading = false;
        showCommentField = false;
        showRequestField = false;
        commentController.clear();
        requestController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // زر إضافة تعليق
            Expanded(
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    showCommentField = true;
                    showRequestField = false;
                  });
                },
                icon: const Icon(Icons.comment, color: Colors.black),
                label: const Text(
                  'إضافة تعليق',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(width: 16),

            // زر تقديم طلب
            Expanded(
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    showRequestField = true;
                    showCommentField = false;
                  });
                },
                icon: const Icon(Icons.add_task, color: Colors.blue),
                label: const Text(
                  'تقديم طلب',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // إظهار حقل التعليق عند الضغط على إضافة تعليق
        if (showCommentField)
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: commentController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'أدخل تعليقك هنا...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    filled: true,
                    fillColor: Colors.grey[200], // لون الخلفية للحقل
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  if (commentController.text.isNotEmpty) {
                    // استدعاء الوظيفة لتقديم التعليق
                    submitForm(content: commentController.text, isRequest: false);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('يرجى إدخال تعليق.'),
                    ));
                  }
                },
                child: const Text('إرسال'),
              ),
            ],
          ),

        const SizedBox(height: 16),

        // إظهار حقل الطلب عند الضغط على تقديم طلب
        if (showRequestField)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                value: selectedRequestType,
                items: requestTypes
                    .map((type) => DropdownMenuItem<String>(
                          value: type,
                          child: Text(type),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedRequestType = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'اختر نوع الطلب',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200], // لون الخلفية للقائمة المنسدلة
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: requestController,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'أدخل تفاصيل الطلب هنا...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.grey[200], // لون الخلفية للحقل
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (requestController.text.isNotEmpty) {
                        // استدعاء الوظيفة لتقديم الطلب
                        submitForm(content: requestController.text, isRequest: true);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('يرجى إدخال تفاصيل الطلب.'),
                        ));
                      }
                    },
                    child: const Text('إرسال'),
                  ),
                ],
              ),
            ],
          ),

        const SizedBox(height: 16),

        // قائمة الطلبات
        if (requests.isNotEmpty)
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('قائمة الطلبات:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: requests.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: ListTile(
                        title: Text(requests[index]['request_type']),
                        subtitle: Text(requests[index]['description']),
                        trailing: Text(requests[index]['status']),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}
