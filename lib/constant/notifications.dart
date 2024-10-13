
import 'package:application_aqars/controller/notifications_page.dart';
import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  const Notify({super.key});

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            NotificationItem(
              icon: Icons.home_repair_service,
              time: '2:25 صباحاً',
              title: 'مكتب بيوت',
              description:
                  'وفر بعض من شروط طلبك في اعلان , انقر للتوجهة للاعلان',
              isRead: false,
            ),
            NotificationItem(
              icon: Icons.build,
              time: '3:25 صباحاً',
              title: 'مكتب خدمات',
              description:
                  'وفر بعض من شروط طلبك في اعلان , انقر للتوجهة للاعلان',
              isRead: true,
            ),
            NotificationItem(
              icon: Icons.work,
              time: '4:10 صباحاً',
              title: 'مكتب كذا',
              description:
                  'وفر بعض من شروط طلبك في اعلان , انقر للتوجهة للاعلان',
              isRead: false,
            ),
            NotificationItem(
              icon: Icons.house,
              time: '5:30 صباحاً',
              title: 'مكتب بيوت',
              description:
                  'وفر بعض من شروط طلبك في اعلان , انقر للتوجهة للاعلان',
              isRead: true,
            ),
            NotificationItem(
              icon: Icons.star,
              time: '6:45 صباحاً',
              title: 'مكتب نجم',
              description: 'تحقق من عروضنا الجديدة! انقر للتوجهة للاعلان',
              isRead: false,
            ),
            NotificationItem(
              icon: Icons.notification_important,
              time: '7:15 صباحاً',
              title: 'مكتب مهم',
              description: 'تحديث هام: انقر للاطلاع على التفاصيل',
              isRead: true,
            ),
            NotificationItem(
              icon: Icons.info,
              time: '8:00 صباحاً',
              title: 'مكتب معلومات',
              description: 'معلومات جديدة متوفرة الآن! انقر للتوجهة للاعلان',
              isRead: false,
            ),
            NotificationItem(
              icon: Icons.access_alarm,
              time: '9:20 صباحاً',
              title: 'مكتب توقيت',
              description: 'تذكير بموعد قادم: انقر للتوجهة للاعلان',
              isRead: true,
            ),
            NotificationItem(
              icon: Icons.attach_money,
              time: '10:30 صباحاً',
              title: 'مكتب مال',
              description: 'عروض مالية جديدة: انقر للتوجهة للاعلان',
              isRead: false,
            ),
            NotificationItem(
              icon: Icons.language,
              time: '11:40 صباحاً',
              title: 'مكتب لغات',
              description: 'دروس جديدة متاحة: انقر للتوجهة للاعلان',
              isRead: true,
            ),
          ],
        ),
      ),
    );
  }
}
