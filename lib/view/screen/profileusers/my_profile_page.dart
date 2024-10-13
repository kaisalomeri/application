import 'package:application_aqars/constant/notifications.dart';
import 'package:application_aqars/view/screen/profileusers/aboutus.dart';
import 'package:application_aqars/view/screen/profileusers/blogus.dart';
import 'package:application_aqars/view/screen/profileusers/callus.dart';
import 'package:application_aqars/view/screen/profileusers/logout.dart';
import 'package:application_aqars/view/screen/profileusers/privacy_policy.dart';
import 'package:application_aqars/view/screen/profileusers/settings.dart';
import 'package:application_aqars/view/screen/profileusers/support.dart';
import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF354B9F),
                Color(0xFF25346E),
                Color(0xFF25346E),
                Color(0xFF131B39),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        title: const Text(
          'حسابي',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildProfileSection(),
          _buildDivider(),
          // _buildListItem(context, Icons.business_center, 'اصحاب الاعمال',
          //     const BusinessOwnersPage()),
          // _buildDivider(),
          // _buildListItem(
          //     context, Icons.edit, 'تعديل اعلاناتي', const AdsPage()),
          // _buildDivider(),
          // _buildListItem(context, Icons.description, 'الوثائق المطلوبة',
          //     const DocumentsPage()),
          _buildListItem(context, Icons.blinds, 'مدونة', const Blogus()),
          _buildDivider(),
          _buildListItem(
              context, Icons.settings, 'اعدادات',  SettingsPage()),
          _buildDivider(),
          _buildListItem(context, Icons.add_alert_rounded, 'الاشعارات ',
               Notify()),
          _buildDivider(),
          _buildListItem(
              context, Icons.add_call, 'اتصل بناء', const Callus()),
          _buildDivider(),
          _buildListItem(
              context, Icons.assignment_late, 'نبذة عنا',  Aboutus()),
          _buildDivider(),
          _buildListItem(context, Icons.privacy_tip, 'سياسة الخصوصية',
               PrivacyPolicyPage()),
          _buildDivider(),
          _buildListItem(
              context, Icons.support, 'مساعدة ودعم',  SupportPage()),
          _buildDivider(),
          _buildListItem(
              context, Icons.logout, 'تسجيل خروج', const Logout()),
          Container(
            margin: const EdgeInsets.only(top: 20),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return ListTile(
      leading: const Stack(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/app1.jpeg'),
            radius: 33,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Icon(Icons.check_circle,
                color: Color.fromARGB(255, 37, 52, 110)),
          ),
        ],
      ),
      title: const Text(' اسم المستخدم'),
      subtitle: Row(
        children: [
          Row(
            children: List.generate(
                5,
                (index) =>
                    const Icon(Icons.star, color: Colors.yellow, size: 16)),
          ),
          const SizedBox(width: 5),
          const Text('(5)', style: TextStyle(fontSize: 12)),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.qr_code),
        onPressed: () {
          // فتح كود بار
        },
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(color: Color(0xFFEDEDED), thickness: 2);
  }

  Widget _buildListItem(
      BuildContext context, IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(icon, color: Color.fromARGB(255, 37, 52, 110)),
      title: Text(title, style: const TextStyle(color: Colors.black)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}




// class BusinessOwnersPage extends StatelessWidget {
//   const BusinessOwnersPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('اصحاب الاعمال'),
//       ),
//       body: const Center(child: Text('صفحة اصحاب الاعمال')),
//     );
//   }
// }

// class AdsPage extends StatelessWidget {
//   const AdsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('تعديل اعلاناتي'),
//       ),
//       body: const Center(child: Text('صفحة تعديل اعلاناتي')),
//     );
//   }
// }

// class DocumentsPage extends StatelessWidget {
//   const DocumentsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('الوثائق المطلوبة'),
//       ),
//       body: const Center(child: Text('صفحة الوثائق المطلوبة')),
//     );
//   }
// }

