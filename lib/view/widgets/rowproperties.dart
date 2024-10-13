import 'package:flutter/material.dart';
import '../../../model/server/real-estates-all.dart';
import '../../../model/server/users-all.dart';
import '../../servers/server/follbutton.dart';
import '../../servers/server/LikeButton.dart';
import 'package:share_plus/share_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';

// دالة لبناء قائمة المنشورات
Widget buildPostsList(List<RealEstateAll> realEstates, List<UserAll> users) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const AlwaysScrollableScrollPhysics(),
    itemCount: realEstates.length,
    itemBuilder: (context, index) {
      return buildPostItem(realEstates[index], users[index]);
    },
  );
}

Widget buildPostItem(RealEstateAll estate, UserAll user) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: const Color(0xFFF2F2F2),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المنشور
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                width: 100, // عرض الصورة
                height: 100, // ارتفاع الصورة
               child: Image.network(
                      estate.attachments.isNotEmpty
                          ? estate.attachments[0].filePath
                          : 'assets/images/default_image.jpg', // صورة افتراضية
                      fit: BoxFit.cover, // جعل الصورة تغطي المساحة المحددة
                    ),
              ),
            ),
            const SizedBox(width: 16.0),
            // العمود الذي يحتوي على النصوص
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // السعر
                  Text(
                    '${estate.price}', // السعر
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // العنوان والتفاصيل الأخرى
                  Text(
                    estate.status, // العنوان
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(estate.advertisement.likesCount.toString()),
                  Text(estate.location),
                ],
              ),
            ),
            // زر القلب
            LikeButton(advertisementId: estate.id, userId: user.id),
          ],
        ),
        const SizedBox(height: 15.0),
        // تفاصيل المزود وأزرار الإجراءات
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // معلومات المزود (صورة، تقييم، موقع)
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
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            SizedBox(width: 4.0),
                            Text(estate.advertisement.viewsCount.toString()),
                          ],
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          estate.location,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            // أزرار الإجراءات
            Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 100, maxWidth: 150),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF354B9F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'الانتقال للعرض',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                        SizedBox(width: 4.0),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 100, maxWidth: 150),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FollowButton(
                          userId: user.id,
                          providerId: estate.advertisement.providerId),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '3 مايو',
            style: TextStyle(color: Color(0xFF6A7380)),
          ),
        ),
      ],
    ),
  );
}
