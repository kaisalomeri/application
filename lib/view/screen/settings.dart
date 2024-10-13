import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الإعدادات'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(), // For smooth scrolling
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSettingCard(
              context,
              icon: Icons.help_center,
              label: 'مركز المساعدة',
              onTap: () {
                Navigator.pushNamed(context, '/help');
                // Add your function here
              },
            ),
            _buildSettingCard(
              context,
              icon: Icons.phone,
              label: 'احصل على مساعدة, اتصل بنا',
              onTap: () {
                Navigator.pushNamed(
                    context, '/contactUs'); // Add your function here
              },
            ),
            _buildSettingCard(
              context,
              icon: Icons.account_circle,
              label: 'حسابي',
              onTap: () {
                Navigator.pushNamed(context, '/contactUs');
              },
            ),
            _buildSettingCard(
              context,
              icon: Icons.security,
              label: 'كلمة السر, الامان',
              onTap: () {
                Navigator.pushNamed(context, '/contactUs');
              },
            ),
            _buildSettingCard(
              context,
              icon: Icons.language,
              label: 'اللغة',
              onTap: () {
                Navigator.pushNamed(context, '/langPage');
              },
            ),
            _buildSettingCard(
              context,
              icon: Icons.notifications,
              label: 'الاشعارات',
              onTap: () {
                Navigator.pushNamed(context, '/notificationPage');
              },
            ),
            _buildSettingCard(
              context,
              icon: Icons.policy,
              label: 'الشروط وسياسة الخصوصية',
              onTap: () {
                Navigator.pushNamed(context, '/privacyPage');
              },
            ),
            _buildSettingCard(
              context,
              icon: Icons.report,
              label: 'بلاغات عن مكاتب',
              onTap: () {
                Navigator.pushNamed(context, '/contactUs');
              },
            ),
            _buildSettingCard(
              context,
              icon: Icons.info,
              label: 'معلومات عن التطبيق',
              onTap: () {
                Navigator.pushNamed(context, '/appInfo');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 4.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40.0,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20.0,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}