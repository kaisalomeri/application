import 'package:flutter/material.dart';
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الاشعارات'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          NotificationItem(
            icon: Icons.home_repair_service,
            time: '2:25 صباحاً',
            title: 'مكتب بيوت',
            description: 'وفر بعض من شروط طلبك في اعلان , انقر للتوجهة للاعلان',
            isRead: false,
          ),
          NotificationItem(
            icon: Icons.build,
            time: '3:25 صباحاً',
            title: 'مكتب خدمات',
            description: 'وفر بعض من شروط طلبك في اعلان , انقر للتوجهة للاعلان',
            isRead: true,
          ),
          NotificationItem(
            icon: Icons.work,
            time: '4:10 صباحاً',
            title: 'مكتب كذا',
            description: 'وفر بعض من شروط طلبك في اعلان , انقر للتوجهة للاعلان',
            isRead: false,
          ),
          NotificationItem(
            icon: Icons.house,
            time: '5:30 صباحاً',
            title: 'مكتب بيوت',
            description: 'وفر بعض من شروط طلبك في اعلان , انقر للتوجهة للاعلان',
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
    );
  }
}

class NotificationItem extends StatelessWidget {
  final IconData icon;
  final String time;
  final String title;
  final String description;
  final bool isRead;

  const NotificationItem({
    Key? key,
    required this.icon,
    required this.time,
    required this.title,
    required this.description,
    required this.isRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Circle Indicator
            Container(
              width: 12.0,
              height: 12.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isRead
                    ? Colors.green
                    : Colors.yellow, // Green for read, yellow for unread
              ),
            ),
            SizedBox(width: 16.0),
            // Notification Icon
            Icon(
              icon,
              size: 40.0,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            )),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            SizedBox(height: 8.0),
            Text(
              time,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        onTap: () {
          // Handle notification tap
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تم النقر على الاشعار: $title'),
            ),
          );
        },
      ),
    );
  }
}
