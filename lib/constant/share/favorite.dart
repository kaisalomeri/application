// // import 'package:application_aqars/servers/server/ApiFvariteadvertment.dart';
// // import 'package:flutter/material.dart';
// // import '../../model/server/favriteandadvertment.dart'; // تأكد من أن المسار صحيح
// // // import '../../services.dart'; // تأكد من أن المسار صحيح

// // class FavoritesPage extends StatefulWidget {
// //   final int userId;

// //   const FavoritesPage({Key? key, required this.userId}) : super(key: key);

// //   @override
// //   _FavoritesPageState createState() => _FavoritesPageState();
// // }

// // class _FavoritesPageState extends State<FavoritesPage> {
// //   late Future<List<Advertisement>> _advertisements;

// //   @override
// //   void initState() {
// //     super.initState();
// //     // جلب الإعلانات عند تحميل الصفحة
// //     _advertisements = ApiServices().fetchAdvertisements(widget.userId);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('الإعلانات المفضلة'),
// //       ),
// //       body: FutureBuilder<List<Advertisement>>(
// //         future: _advertisements,
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return Center(child: CircularProgressIndicator()); // دائرة تحميل
// //           } else if (snapshot.hasError) {
// //             return Center(child: Text('حدث خطأ: ${snapshot.error}')); // رسالة خطأ
// //           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //             return Center(child: Text('لا توجد إعلانات مفضلة بعد.')); // رسالة إذا كانت القائمة فارغة
// //           }

// //           // عرض قائمة الإعلانات
// //           final advertisements = snapshot.data!;
// //           return ListView.builder(
// //             itemCount: advertisements.length,
// //             itemBuilder: (context, index) {
// //               final advert = advertisements[index];
// //               return Card(
// //                 margin: EdgeInsets.all(8.0),
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(16.0),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         advert.title,
// //                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                       ),
// //                       SizedBox(height: 8),
// //                       Text('عدد المشاهدات: ${advert.viewsCount}'),
// //                       Text('عدد المشاركات: ${advert.sharesCount}'),
// //                       Text('عدد الإعجابات: ${advert.likesCount}'),
// //                       Text('الحالة: ${advert.status}'),
// //                       Text('تاريخ الإنشاء: ${advert.providerId}'),
// //                       SizedBox(height: 8),
// //                       Text('الوصف: ${advert.realEstate.description}'),
// //                       SizedBox(height: 8),
// //                       Text('السعر: ${advert.realEstate.price}'),
// //                     ],
// //                   ),
// //                 ),
// //               );
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:application_aqars/servers/server/ApiFvariteadvertment.dart';
// import '../../model/server/favriteandadvertment.dart'; // تأكد من أن المسار صحيح

// class FavoritesPage extends StatefulWidget {
//   final int userId;

//   const FavoritesPage({Key? key, required this.userId}) : super(key: key);

//   @override
//   _FavoritesPageState createState() => _FavoritesPageState();
// }

// class _FavoritesPageState extends State<FavoritesPage> {
//   late Future<List<Advertisement>> _advertisements;

//   @override
//   void initState() {
//     super.initState();
//     // جلب الإعلانات عند تحميل الصفحة
//     _advertisements = ApiServices().fetchAdvertisements(widget.userId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('الإعلانات المفضلة'),
//       ),
//       body: FutureBuilder<List<Advertisement>>(
//         future: _advertisements,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator()); // دائرة تحميل
//           } else if (snapshot.hasError) {
//             return Center(
//                 child: Text('حدث خطأ: ${snapshot.error}')); // رسالة خطأ
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(
//                 child: Text(
//                     'لا توجد إعلانات مفضلة بعد.')); // رسالة إذا كانت القائمة فارغة
//           }

//           // عرض قائمة الإعلانات
//           final advertisements = snapshot.data!;
//           return ListView.builder(
//             itemCount: advertisements.length,
//             itemBuilder: (context, index) {
//               final advert = advertisements[index];
//               // التأكد من وجود مرفقات وصورة
//               final hasImage = advert.realEstate.attachments.isNotEmpty;

//               return Card(
//                 margin: EdgeInsets.all(8.0),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         advert.title,
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 8),
//                       hasImage
//                           ? Image.network(
//                               advert.realEstate.attachments[0]
//                                   .filePath, // رابط الصورة
//                               height: 200, // تحديد الارتفاع
//                               width: double
//                                   .infinity, // تحديد العرض ليكون كامل الشاشة
//                               fit: BoxFit.cover, // ملء الحاوية بطريقة ملائمة
//                             )
//                           : SizedBox(), // عرض لا شيء إذا لم تكن هناك صورة
//                       SizedBox(height: 8),
//                       Text('عدد المشاهدات: ${advert.viewsCount}'),
//                       Text('عدد المشاركات: ${advert.sharesCount}'),
//                       Text('عدد الإعجابات: ${advert.likesCount}'),
//                       Text('الحالة: ${advert.status}'),
//                       Text('تاريخ الإنشاء: ${advert.providerId}'),
//                       SizedBox(height: 8),
//                       Text('الوصف: ${advert.realEstate.description}'),
//                       SizedBox(height: 8),
//                       Text('السعر: ${advert.realEstate.price}'),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:application_aqars/servers/server/ApiFvariteadvertment.dart';
import '../../model/server/favriteandadvertment.dart';
import '../../servers/server/LikeButton.dart';

class FavoritesPage extends StatefulWidget {
  final int userId;

  const FavoritesPage({Key? key, required this.userId}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Future<List<Advertisement>> _advertisements;
  void navigateToDetails(int userId) {
    Navigator.pushNamed(context, '/detailsproprty', arguments:widget.userId);
  }
  @override
  void initState() {
    super.initState();
    _advertisements = ApiServices().fetchAdvertisements(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الإعلانات المفضلة'),
        backgroundColor: const Color(0xFF354B9F),
      ),
      body: FutureBuilder<List<Advertisement>>(
        future: _advertisements,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('لا توجد إعلانات مفضلة بعد.'));
          }

          final advertisements = snapshot.data!;
          return ListView.builder(
            itemCount: advertisements.length,
            itemBuilder: (context, index) {
              final advert = advertisements[index];
              return buildPostItem(advert);
            },
          );
        },
      ),
    );
  }

  Widget buildPostItem(Advertisement advert) {
    final hasImage = advert.realEstate.attachments.isNotEmpty;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // تغير موضع الظل
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة الإعلان
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: hasImage
                      ? Image.network(
                          advert.realEstate.attachments[0].filePath,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/default_image.jpg',
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(width: 16.0),
              // العمود الذي يحتوي على النصوص
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      advert.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text('الحالة: ${advert.status}'),
                    Text('عدد المشاهدات: ${advert.viewsCount}'),
                    Text('عدد الإعجابات: ${advert.likesCount}'),
                    Text('السعر: ${advert.realEstate.price}'),
                  ],
                ),
              ),
              // زر القلب
              LikeButton(advertisementId: advert.id, userId: widget.userId),
            ],
          ),
          const SizedBox(height: 15.0),
          // تفاصيل المزود
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          const AssetImage('assets/images/app1.jpeg'),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 15,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 18, 82, 135),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 10,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'مقدم من: ${advert.providerId}',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            advert.realEstate.location,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8.0),
              // زر للإجراء
              ElevatedButton(
                onPressed: () {
                 navigateToDetails(advert.realEstate.id);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF354B9F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'عرض التفاصيل',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
           Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'مقدم من: ${advert.realEstate.createdAt}',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
