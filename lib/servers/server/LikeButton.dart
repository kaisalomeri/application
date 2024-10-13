// // import 'package:flutter/material.dart';
// // import 'package:dio/dio.dart';

// // class LikeButton extends StatefulWidget {
// //   final int advertisementId;
// //   final int userId; // يمكنك استخدام المستخدم المسجل

// //   LikeButton({required this.advertisementId, required this.userId});

// //   @override
// //   _LikeButtonState createState() => _LikeButtonState();
// // }
// // class _LikeButtonState extends State<LikeButton> {
// //   bool isLiked = false; // لتتبع حالة الإعجاب

// //   // دالة لتبديل حالة الإعجاب
// //   void _toggleLike() async {
// //     try {
// //       Dio dio = Dio();
// //       Response response = await dio.post(
// //         'http://127.0.0.1:8000/api/like', // استبدل بالرابط الخاص بك
// //         data: {
// //           'advertisement_id': widget.advertisementId,
// //           'user_id': widget.userId,
// //         },
// //       );

// //       if (response.data['status'] == 'liked') {
// //         setState(() {
// //           isLiked = true; // تم الإعجاب
// //         });
// //       } else if (response.data['status'] == 'unliked') {
// //         setState(() {
// //           isLiked = false; // تم إلغاء الإعجاب
// //         });
// //       }
// //     } catch (e) {
// //       print('Error liking advertisement: $e');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return IconButton(
// //       icon: Icon(
// //         isLiked ? Icons.favorite : Icons.favorite_border,
// //         color: isLiked ? Colors.blue : Colors.grey, // تغيير اللون بناءً على حالة الإعجاب
// //       ),
// //       onPressed: _toggleLike, // عند الضغط سيتم استدعاء الدالة
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// class LikeButton extends StatefulWidget {
//   final int advertisementId;
//   final int userId;

//   LikeButton({required this.advertisementId, required this.userId});

//   @override
//   _LikeButtonState createState() => _LikeButtonState();
// }

// class _LikeButtonState extends State<LikeButton> {
//   bool isLiked = false;

//   void _toggleLike() async {
//     try {
//       Dio dio = Dio();
//       Response response = await dio.post(
//         'http://127.0.0.1:8000/api/like',
//         data: {
//           'advertisement_id': widget.advertisementId,
//           'user_id': widget.userId,
//         },
//       );

//       if (response.data['status'] == 'liked') {
//         setState(() {
//           isLiked = true;
//         });
//         // عرض رسالة تفيد بأن الإعلان تمت إضافته إلى المفضلة
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('تم إضافة الإعلان إلى المفضلة!'),
//             duration: Duration(seconds: 2),
//           ),
//         );
//       } else if (response.data['status'] == 'unliked') {
//         setState(() {
//           isLiked = false;
//         });
//         // عرض رسالة تفيد بأن الإعلان تمت إزالته من المفضلة
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('تمت إزالة الإعلان من المفضلة!'),
//             duration: Duration(seconds: 2),
//           ),
//         );
//       }
//     } catch (e) {
//       print('Error liking advertisement: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: Icon(
//         isLiked ? Icons.favorite : Icons.favorite_border,
//         color: isLiked ? Colors.blue : Colors.grey,
//       ),
//       onPressed: () {
//         _toggleLike();
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LikeButton extends StatefulWidget {
  final int advertisementId;
  final int userId;

  LikeButton({required this.advertisementId, required this.userId});

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false; // لتتبع حالة الإعجاب

  @override
  void initState() {
    super.initState();
    _loadLikeStatus(); // تحميل حالة الإعجاب عند بدء تشغيل الواجهة
  }

  // دالة لتحميل حالة الإعجاب من SharedPreferences
  void _loadLikeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLiked = prefs.getBool('isLiked_${widget.advertisementId}') ?? false;
    });
  }

  // دالة لحفظ حالة الإعجاب في SharedPreferences
  void _saveLikeStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLiked_${widget.advertisementId}', status);
  }

  // دالة لتبديل حالة الإعجاب
  void _toggleLike() async {
    try {
      Dio dio = Dio();
      Response response = await dio.post(
        'http://127.0.0.1:8000/api/like', // استبدل بالرابط الخاص بك
        data: {
          'advertisement_id': widget.advertisementId,
          'user_id': widget.userId,
        },
      );

      if (response.data['status'] == 'liked') {
        setState(() {
          isLiked = true; // تم الإعجاب
        });
        _saveLikeStatus(true); // حفظ حالة الإعجاب
        _showLikeDialog('تم إضافة الإعلان إلى المفضلة!', Colors.green);
      } else if (response.data['status'] == 'unliked') {
        setState(() {
          isLiked = false; // تم إلغاء الإعجاب
        });
        _saveLikeStatus(false); // حفظ حالة الإعجاب
        _showLikeDialog('تمت إزالة الإعلان من المفضلة!', Colors.red);
      }
    } catch (e) {
      print('Error liking advertisement: $e');
      _showLikeDialog('حدث خطأ أثناء إضافة الإعلان إلى المفضلة.', Colors.red);
    }
  }

  // دالة لعرض رسالة تنبيهية
  void _showLikeDialog(String message, Color color) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: color,
          content: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              child: Text(
                'موافق',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isLiked ? Icons.favorite : Icons.favorite_border,
        color: isLiked ? Colors.blue : Colors.grey, // لون القلب
      ),
      onPressed: _toggleLike, // عند الضغط سيتم استدعاء الدالة
    );
  }
}
